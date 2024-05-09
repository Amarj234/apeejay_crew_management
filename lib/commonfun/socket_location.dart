
import 'package:geocoding/geocoding.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../config/sharedPrefs.dart';

class SocketLocation{

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();


  void onConnectPressed() async {
    // Remove keyboard
    //  FocusScope.of(context).requestFocus(FocusNode());

    try {
      await pusher.init(
          useTLS: true,
          apiKey: "d93aedf595f9d524f207",
          cluster: "ap2",
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onSubscriptionCount: onSubscriptionCount,
          onAuthorizer: onAuthorizer);

      await pusher.subscribe(channelName: "private-user-location");
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    print(jsonDecode(event.data));
    // var data = jsonDecode(event.data);


  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "d93aedf595f9d524f207:${getSignature("$socketId:$channelName")}",
      "shared_secret": "d93aedf595f9d524f207"
    };
  }

  getSignature(String value) {
    var key = utf8.encode('ccf780f26fe933ffde8a');
    var bytes = utf8.encode(value);
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    print("HMAC signature in string is: $digest");
    return digest;
  }

  UserPrefs prefs = UserPrefs();

  void onTriggerEventPressed({required double long, required double lat}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    var id = prefs.getData("id") ?? "";
    Map data = {
      "location": {"lat":lat, "long": long},
      "user_id": int.parse(id),
      "address": "${placemarks[0].name} ${placemarks[0].locality} ${placemarks[0].street}  ${placemarks[0].subLocality} ${placemarks[0].country} ${placemarks[0].postalCode}",

    };

    pusher.trigger(
      PusherEvent(
        channelName: "private-user-location",
        eventName: "client-location-event",
        data: jsonEncode(data),
      ),
    );

  }


}