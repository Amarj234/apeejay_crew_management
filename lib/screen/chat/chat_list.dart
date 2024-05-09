import 'package:apeejay_crew_management/screen/chat/chat_screen.dart';
import 'package:apeejay_crew_management/screen/commonwidget/main_appbar.dart';
import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:flutter/material.dart';

import '../../model/chart_model.dart';

import '../menu/side_menu.dart';
import 'widget/conversation_List.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: AssetImages.girl, time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: AssetImages.boy, time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL:AssetImages.girl, time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: AssetImages.boy, time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: AssetImages.girl, time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: AssetImages.boy, time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: AssetImages.girl, time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: AssetImages.boy, time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(context: context,
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));

              },
              child: ConversationList(
                name: chatUsers[index].name,
                messageText: chatUsers[index].messageText,
                imageUrl: chatUsers[index].imageURL,
                time: chatUsers[index].time,
                isMessageRead: (index == 0 || index == 3)?true:false,
              ),
            );
          },
        ),
      ),
    );
  }
}
