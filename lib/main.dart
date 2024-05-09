import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:crypto/crypto.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import 'commonfun/api_request.dart';
import 'commonfun/app_provider.dart';
import 'commonfun/socket_location.dart';
import 'config/firebase_options.dart';
import 'config/notificationservice.dart';
import 'config/sharedPrefs.dart';
import 'screen/onboardingScreen/onboarding_screen.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print("PhoneState1");
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  // Timer.periodic(const Duration(seconds: 1), (timer) async {
  if (service is AndroidServiceInstance) {
    if (await service.isForegroundService()) {
      flutterLocalNotificationsPlugin.show(
        888,
        'COOL SERVICE',
        'Awesome ${DateTime.now()}',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'my_foreground',
            'MY FOREGROUND SERVICE',
            icon: 'ic_bg_service_small',
            ongoing: true,
          ),
        ),
      );
      WidgetsFlutterBinding.ensureInitialized();

      // if you don't using custom notification, uncomment this
      service.setForegroundNotificationInfo(
        title: "Apeejy Location Service",
        content: "Updated Location",
      );

      // Timer.periodic(const Duration(seconds: 30), (timer)  {
      //   Map data = {
      //     "location": {"lat":23, "long": 232},
      //     "user_id": int.parse(79.toString()),
      //     "address": "{placemarks[0].name} {placemarks[0].locality} {placemarks[0].street}  {placemarks[0].subLocality} {placemarks[0].country} {placemarks[0].postalCode}",
      //
      //   };
      //   print("pusher.trigger234");
      //   pusher.trigger(
      //     PusherEvent(
      //       channelName: "private-user-location",
      //       eventName: "client-location-event",
      //       data: jsonEncode(data),
      //     ),
      //   );
      //
      // });
    }
  }
  // mytest();
  //});
}

UserPrefs prefs = UserPrefs();
PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

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

SocketLocation socketLocation = SocketLocation();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Apeejy Location Service234");

  String? login = prefs.getData("login");
  if (login == "yes") {
    pusher.unsubscribe(channelName: "private-user-location");
    pusher.disconnect();
    Future.delayed(Duration(seconds: 2), () async {
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

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      StreamSubscription<Position> positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) async {
        print(position == null
            ? 'Unknown'
            : 'getPositionStream'
                '${position.latitude.toString()}, ${position.longitude.toString()}');
        await Api().postReq({
          "latitude": position!.latitude.toString(),
          "longitude": position.longitude.toString()
        }, "save-location");
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        var id = prefs.getData("id") ?? "";
        Map data = {
          "location": {"lat": position.latitude, "long": position.longitude},
          "user_id": int.parse(id),
          "address":
              "${placemarks[0].name} ${placemarks[0].locality} ${placemarks[0].street}  ${placemarks[0].subLocality} ${placemarks[0].country} ${placemarks[0].postalCode}",
        };

        print("pusher.trigger234");

        pusher.trigger(
          PusherEvent(
            channelName: "private-user-location",
            eventName: "client-location-event",
            data: jsonEncode(data),
          ),
        );
      });
    });
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeService();
  NotificationService().initNotification();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationService().showNotificationsimple(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    NotificationService().showNotificationsimple(message);
    debugPrint('onMessageOpenedApp: ${message.notification!.title.toString()}');
  });

  runApp(MultiBlocProvider(
      providers: AppProvider.appProvider.providers(), child: const MyApp()));
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'Apeejy Crew Management',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const OnboardingContent(),
          ),
        );
      },
    );
  }
}
