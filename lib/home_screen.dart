
import 'dart:convert';
import 'dart:io';

import 'package:apeejay_crew_management/screen/appliedjob/applied_job.dart';

import 'package:apeejay_crew_management/screen/commonwidget/buttom_tab.dart';
import 'package:apeejay_crew_management/screen/menu/side_menu.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'commonBloc/blocTab/bloctab_bloc.dart';
import 'commonBloc/location/location_bloc.dart';
import 'main.dart';
import 'screen/announcement/announcement_screen.dart';
import 'screen/chat/chat_screen.dart';
import 'screen/commonwidget/costum_snackbar.dart';
import 'screen/commonwidget/no_internet.dart';
import 'screen/mainpage/main_page.dart';
import 'screen/notification/bloc/notification_bloc.dart';
import 'screen/profileSetup/profile_update.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!


      print("internet234  $result");
      if(result==ConnectivityResult.wifi || result ==ConnectivityResult.mobile|| result ==ConnectivityResult.none){


      }else{
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const MyApp()));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NoInternet()));
      }
    });
   // context.read<ChatBloc>().add(GetChathis());
    if(widget.index !=null){
      context.read<LandingPageBloc>().add(TabChange(tabIndex: widget.index!));

    }
    context.read<NotificationBloc>().add(CountNotificationevent());
    context.read<LocationBloc>().add(SaveLocation());
    // InAppUpdate.checkForUpdate().then((update) {
    //   if(update.updateAvailability==UpdateAvailability.updateAvailable){
    //     InAppUpdate.performImmediateUpdate();
    //   }
   // });
  }

  int waitForSecondBackPress = 2;
  int onFirstBackPress = 1;

  void resetBackTimeout() {
    Future.delayed(const Duration(seconds: 2), () {
      onFirstBackPress = 1;
    });
  }
  List<Widget> myPageList = [const AppliedJob(),  const ChatScreen(), const MainPage(), const AnnouncementScreen(),  const UpdateProfile()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if (onFirstBackPress == 1) {
          onFirstBackPress = 2;
           CostomSnackbar.show(context, 'Press back again to exit app',
             );

          resetBackTimeout();
          return false;
        } else {
          Navigator.of(context).pop(true);
          exit(0);
        }
      },
      child: Scaffold(

          endDrawer: const SideMenu(),
          key: scaffoldKey,

          bottomNavigationBar: buttomBar(context),
          body:  BlocConsumer<LandingPageBloc, LandingPageState>(
  listener: (context, state) {

    // TODO: implement listener
  },
  builder: (context, state) {
    return myPageList[state.tabIndex];
  },
)),

    );
  }
}
