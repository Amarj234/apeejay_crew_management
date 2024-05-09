import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:age_calculator/age_calculator.dart';
import 'package:apeejay_crew_management/screen/chat/bloc/chat_bloc.dart';
import 'package:apeejay_crew_management/screen/commonwidget/main_appbar.dart';
import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../config/baseUrl.dart';
import '../../config/sharedPrefs.dart';
import '../../model/chat.dart';
import '../../utils/style.dart';
import '../menu/side_menu.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'widget/chat_buttom.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  ScrollController scrollController = ScrollController();
  TextEditingController message = TextEditingController();

  void scrollListToEND() {
    print((messages1.length > 5));
    if (messages1.length > 5) {
      scrollController.animateTo(
          scrollController.position.maxScrollExtent + 200,
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut);
    }
  }

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

      await pusher.subscribe(channelName: "private-chats");
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
    var data = jsonDecode(event.data);
    bool changedate = false;

    final duration = AgeCalculator.dateDifference(
      fromDate: DateFormat("dd/MM/yyyy").parse(data['date']),
      toDate: DateTime.now(),
    );
    if (duration.days == 0) {
      changedate = false;
    } else {
      changedate = true;
    }
    messages1.add(ChatMessage(
      date: data['date'],
      changedate: changedate,
      messageType:
          data['chat_content']['is_sender_admin'] == 1 ? "receiver" : "sender",
      messageContent: data['chat_content']['message'],
      time: data['time'],
    ));
    messages.sink.add(messages1);

    scrollListToEND();
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

  void onTriggerEventPressed() async {
    var timeFormat = DateFormat('hh:mm a');
    var time = timeFormat.format(DateTime.now());
    var dateformate = DateFormat('dd/MM/yyyy');
    var date = dateformate.format(DateTime.now());

    bool changedate = false;
    if (messages1.isNotEmpty) {
      final duration = AgeCalculator.dateDifference(
        fromDate: DateFormat("dd/MM/yyyy").parse(messages1.last.date),
        toDate: DateTime.now(),
      );

      if (duration.days == 0) {
        changedate = false;
      } else {
        changedate = true;
      }
    } else {
      changedate = true;
    }

    var id = prefs.getData("id") ?? "";
    Map data = {
      "user_id": int.parse(id),
      "changedate": changedate,
      "date": date,
      "time": time,
      "chat_content": {
        "sender_id": int.parse(id),
        "reciever_id": 0,
        "is_sender_admin": 0,
        "message": message.text
      }
    };
    pusher.trigger(
      PusherEvent(
        channelName: "private-chats",
        eventName: "client-chat-event",
        data: jsonEncode(data),
      ),
    );

    context.read<ChatBloc>().add(SendMessage(message.text));
    messages1.add(ChatMessage(
      date: date,
      changedate: false,
      messageType: "sender",
      messageContent: message.text,
      time: time,
    ));
    messages.sink.add(messages1);

    message.clear();
    scrollListToEND();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<ChatMessage> messages1 = [];
  StreamController<List<ChatMessage>> messages =
      StreamController<List<ChatMessage>>.broadcast();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pusher.unsubscribe(channelName: "private-chats");
    pusher.disconnect();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatBloc>().add(GetChathis());
    onConnectPressed();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isshowemoji = false;
      } else {
        isshowemoji = true;
      }
      setState(() {});
    });
  }

  bool isshowemoji = false;
  EmojiPicker emojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        // Do something when emoji is tapped (optional)
      },
      onBackspacePressed: () {
        // Do something when the user taps the backspace button (optional)
        // Set it to null to hide the Backspace-Button
      },
      textEditingController:
          message, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: Config(
        height: 256,
        // bgColor: const Color(0xFFF2F2F2),
        checkPlatformCompatibility: false,
        emojiViewConfig: EmojiViewConfig(
          // Issue: https://github.com/flutter/flutter/issues/28894
          emojiSizeMax: 28 *
              (foundation.defaultTargetPlatform == TargetPlatform.iOS
                  ? 1.20
                  : 1.0),
        ),
        swapCategoryAndBottomBar: false,
        skinToneConfig: const SkinToneConfig(),
        categoryViewConfig: const CategoryViewConfig(),
        bottomActionBarConfig: const BottomActionBarConfig(
            enabled: false, showBackspaceButton: false),
        searchViewConfig: const SearchViewConfig(backgroundColor: Colors.white),
      ),
    );
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(
        context: context,
        back: false,
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        leading: true,
        title: "Chat",
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatLoaded) {
            var element = state.chatMessage.data?.chats;

            for (int i = 0; i < element!.length; i++) {
              bool changedate = false;

              if (i != 0) {
                final duration = AgeCalculator.dateDifference(
                  fromDate: DateFormat("dd/MM/yyyy")
                      .parse(element[i].date.toString()),
                  toDate: DateFormat("dd/MM/yyyy")
                      .parse(element[i - 1].date.toString()),
                );

                if (duration.days == 0) {
                  changedate = false;
                } else {
                  changedate = true;
                }
              } else {
                changedate = true;
              }

              messages1.add(ChatMessage(
                date: element[i].date.toString(),
                changedate: changedate,
                messageType: element[i].chatContent?.isSenderAdmin == 0
                    ? "sender"
                    : "receiver",
                messageContent: element[i].chatContent!.message.toString(),
                time: element[i].time.toString(),
              ));
            }

            messages.sink.add(messages1);
            Future.delayed(const Duration(milliseconds: 500), () {
              scrollListToEND();
            });
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: StreamBuilder<List<ChatMessage>>(
              stream: messages.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(); // Display a loading indicator when waiting for data.
                } else if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // Display an error message if an error occurs.
                } else if (snapshot.data!.isEmpty) {
                  return const Text(
                      ("No Msg")); // Display a message when no data is available.
                } else {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: snapshot.data?.length,
                    // reverse: true,
                    // shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 70),
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: snapshot.data![index].changedate
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff5D5D5D)
                                          .withOpacity(.1),
                                    ),
                                    child: snapshot.data![index].date ==
                                            DateFormat('dd/MM/yyyy')
                                                .format(DateTime.now())
                                                .toString()
                                        ? Text(
                                            "Today",
                                            style: style16w500b,
                                          )
                                        : Text(
                                            snapshot.data![index].date,
                                            style: style16w500b,
                                          ),
                                  )
                                : Container(),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 0, right: 12, top: 10, bottom: 10),
                            child: Align(
                              alignment: (snapshot.data![index].messageType ==
                                      "receiver"
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Row(
                                mainAxisAlignment:
                                    snapshot.data![index].messageType ==
                                            "receiver"
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  snapshot.data![index].messageType ==
                                          "receiver"
                                      ? CircleAvatar(
                                          radius: 21,
                                          backgroundImage: AssetImage(
                                            AssetImages.girl,
                                          ),
                                        )
                                      : Text(snapshot.data![index].time,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: const Color(0xff6C6C6C),
                                          )),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 10,
                                        maxWidth: 250,
                                        maxHeight: 600),
                                    decoration: BoxDecoration(
                                      borderRadius: snapshot
                                                  .data![index].messageType ==
                                              "receiver"
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                      color:
                                          snapshot.data![index].messageType ==
                                                  "receiver"
                                              ? const Color(0xffCFE4E2)
                                              : const Color(0xffFFD8DB),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Text(
                                      maxLines: 100,
                                      overflow: TextOverflow.ellipsis,
                                      snapshot.data![index].messageContent,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  snapshot.data![index].messageType ==
                                          "receiver"
                                      ? Text(snapshot.data![index].time,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: const Color(0xff6C6C6C),
                                          ))
                                      : CircleAvatar(
                                          radius: 21,
                                          backgroundImage: NetworkImage(
                                            "${baseImgUrl}picture/${prefs.getData("profilePhoto")}",
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),

            // child: ListView.builder(
            //   controller:scrollController ,
            //   itemCount: messages.sink,
            //  // reverse: true,
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.only(top: 10, bottom: 70),
            //   // physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return Column(
            //       children: [
            //         Align(
            //           alignment: Alignment.topCenter,
            //           child: messages[index].changedate
            //               ? Container(
            //                   margin: const EdgeInsets.symmetric(vertical: 10),
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 8, horizontal: 12),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     color: const Color(0xff5D5D5D).withOpacity(.1),
            //                   ),
            //                   child: Text(
            //                     messages[index].date,
            //                     style: style16w500b,
            //                   ),
            //                 )
            //               : Container(),
            //         ),
            //         Container(
            //           padding: const EdgeInsets.only(
            //               left: 0, right: 14, top: 10, bottom: 10),
            //           child: Align(
            //             alignment: (messages[index].messageType == "receiver"
            //                 ? Alignment.topLeft
            //                 : Alignment.topRight),
            //             child: Row(
            //               mainAxisAlignment:
            //                   messages[index].messageType == "receiver"
            //                       ? MainAxisAlignment.start
            //                       : MainAxisAlignment.end,
            //               children: [
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //                 messages[index].messageType == "receiver"
            //                     ? CircleAvatar(
            //                         radius: 21,
            //                         backgroundImage: AssetImage(
            //                           AssetImages.girl,
            //                         ),
            //                       )
            //                     : Text(messages[index].time,
            //                         style: GoogleFonts.roboto(
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 12,
            //                           color: const Color(0xff6C6C6C),
            //                         )),
            //                 const SizedBox(
            //                   width: 15,
            //                 ),
            //                 Container(
            //                   constraints:
            //                       const BoxConstraints(minWidth: 10, maxWidth: 250),
            //                   decoration: BoxDecoration(
            //                     borderRadius:
            //                         messages[index].messageType == "receiver"
            //                             ? const BorderRadius.only(
            //                                 topLeft: Radius.circular(5),
            //                                 topRight: Radius.circular(5),
            //                                 bottomRight: Radius.circular(5),
            //                               )
            //                             : const BorderRadius.only(
            //                                 topLeft: Radius.circular(5),
            //                                 topRight: Radius.circular(5),
            //                                 bottomLeft: Radius.circular(5),
            //                               ),
            //                     color: messages[index].messageType == "receiver"
            //                         ? const Color(0xffCFE4E2)
            //                         : const Color(0xffFFD8DB),
            //                   ),
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 16, vertical: 12),
            //                   child: Text(
            //                     maxLines: 5,
            //                     overflow: TextOverflow.ellipsis,
            //                     messages[index].messageContent,
            //                     style: const TextStyle(fontSize: 15),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //                 messages[index].messageType == "receiver"
            //                     ? Text(messages[index].time,
            //                         style: GoogleFonts.roboto(
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 12,
            //                           color: const Color(0xff6C6C6C),
            //                         ))
            //                     : CircleAvatar(
            //                         radius: 21,
            //                         backgroundImage: AssetImage(
            //                           AssetImages.boy,
            //                         ),
            //                       ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            bottom: false,
          );
        },
      ),
      bottomNavigationBar:
          Visibility(visible: isshowemoji, child: emojiPicker()),
      bottomSheet: ChatButtom(
        myfun: () {
          onTriggerEventPressed();
        },
        controller: message,
        emojifun: () {
          isshowemoji = !isshowemoji;
          if (isshowemoji) {
            FocusManager.instance.primaryFocus?.unfocus();
          } else {
            FocusScope.of(context).requestFocus(focusNode);
          }
          setState(() {});
          print(isshowemoji);
        },
        focusNode: focusNode,
      ),
    );
  }
}
