import 'package:age_calculator/age_calculator.dart';
import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/color.dart';
import '../commonWidget/main_appbar.dart';
import '../commonwidget/buttom_tab.dart';
import '../menu/side_menu.dart';
import 'bloc/notification_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String difrent(String date){
   DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
  var  duration = AgeCalculator.dateDifference(
      fromDate: inputDate,
      toDate: DateTime.now(),
    );
  return "${duration.days} days";
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotificationBloc>().add(GetNotification());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomBar(context,ismain: true),
      key: scaffoldKey,
      endDrawer: const SideMenu(isnitification: true,),
      appBar: MainAppbar(
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
        context: context,
        title: "Notification",
      ),
      body: SafeArea(
        child: BlocConsumer<NotificationBloc, NotificationState>(
  listener: (context, state) {
    // TODO: implement listener

        if(state is NotificationLoded){
          state.notificationModel.data!.notifications!.forEach((element) async {
        if (element.isRead == 0){
              context.read<NotificationBloc>().add(RedNotificationevent(element.id.toString()));
        }
      });


        }


  },
  builder: (context, state) {

    if(state is NotificationLoad){
      return const Center(child: CircularProgressIndicator());
    }
    if(state is NotificationError){
      return Center(child: Text(state.error));
    }

    if(state is NotificationLoded){
      var data=state.notificationModel.data?.notifications;
      return data!.isEmpty?const Text("List Not found"): ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              decoration:(index / 2) == 2 || (index / 2) == 4 ?  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff2E8B80).withOpacity(.1) ,
              ):const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  (index / 3) == 1 || (index / 3) == 2 ?  Container(
                    margin: EdgeInsets.only(bottom: (index / 3) == 1 || (index / 3) == 2 ? 10:0),
                    height: 1,
                    width: double.infinity,
                    color: const Color(0xffB5C6C4),
                  ):Container(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          data[index].title??"",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.main),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(difrent(data[index].createdAt.toString()),
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: Text(
                          maxLines: 1,
                          data[index].message??"",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff707070)),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 2,
                        child:(index / 2) == 2 || (index / 2) == 4 ? Image.asset(AssetImages.online):Container(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    }
    return  Container();
  },
),
      ),
    );
  }
}
