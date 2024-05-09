import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../model/announcements_model.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/buttom_tab.dart';
import '../commonwidget/main_appbar.dart';
import '../menu/side_menu.dart';

class AnnouncementDetails extends StatelessWidget {
   AnnouncementDetails({super.key, required this.announcements});
  final Announcements announcements;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
   String difrent(String date) {
     DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
     var outputFormat = DateFormat('dd-MMM-yyyy');
     var outputDate = outputFormat.format(parseDate);
     return outputDate.toString();
   }

   String time(String date) {
     DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
     var outputFormat = DateFormat('hh:mm a');
     var outputDate = outputFormat.format(parseDate);
     return outputDate.toString();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomBar(context,ismain: true),
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(
        back: true,
        context: context,
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
        title:  "Announcement Details",
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,left: 15,right: 15,bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AutoSizeText(
                announcements.title.toString(),
                style: style16w500b,
              ),
                const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AssetImages.dob,color: const Color(0xff909090),width: 12,),
                      const SizedBox(width: 5,),
                      Text(
                          difrent(announcements.broadcastDate.toString()),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff434343),
                          )),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      const Icon(Icons.access_time,size: 12,),
                      const SizedBox(width: 5,),
                      Text(
                          time(announcements.broadcastDate.toString()),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff434343),
                          )),
                    ],
                  )
                ],),

                const SizedBox(height: 20,),
                Text(  announcements.description.toString(),style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff545454),
                    )),


            ],),
          ),
        ),
      ),
    );
  }
}
