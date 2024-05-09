import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../commonBloc/blocTab/bloctab_bloc.dart';
import '../commonBloc/dropdownList/dropdown_bloc.dart';
import '../commonBloc/location/location_bloc.dart';
import '../commonBloc/rankBloc/rank_bloc.dart';
import '../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../screen/announcement/bloc/announcements_bloc.dart';
import '../screen/appliedjob/bloc/appliedjobs_bloc.dart';
import '../screen/chat/bloc/chat_bloc.dart';
import '../screen/introScreen/bloc/intro_bloc.dart';
import '../screen/login/loginbloc/login_bloc.dart';
import '../screen/mainpage/avlBloc/available_bloc.dart';
import '../screen/notification/bloc/notification_bloc.dart';
import '../screen/otp/bloc/timer_bloc.dart';
import '../screen/profileSetup/blocprofiletab/profile_tab_bloc.dart';
import '../screen/profileSetup/submit/submit_bloc.dart';
import '../screen/register/bloc/register_bloc.dart';

class AppProvider {
  AppProvider._();

  static final AppProvider appProvider = AppProvider._();

  List<SingleChildWidget> providers() {
    return [
      BlocProvider<LandingPageBloc>(
        create: (BuildContext context) => LandingPageBloc(),
      ),
      BlocProvider<ProfileTabBloc>(
        create: (BuildContext context) => ProfileTabBloc(),
      ),
      BlocProvider<RegisterBloc>(
        create: (BuildContext context) => RegisterBloc(),
      ),
      BlocProvider<TimerBloc>(
        create: (BuildContext context) => TimerBloc(),
      ),
      BlocProvider<DropdownBloc>(
        create: (BuildContext context) => DropdownBloc(),
      ),
      BlocProvider<UploadPicBloc>(
        create: (BuildContext context) => UploadPicBloc(),
      ),
      BlocProvider<SubmitBloc>(
        create: (BuildContext context) => SubmitBloc(),
      ),
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<AvailableBloc>(
        create: (BuildContext context) => AvailableBloc(),
      ),
      BlocProvider<NotificationBloc>(
        create: (BuildContext context) => NotificationBloc(),
      ),
      BlocProvider<AnnouncementsBloc>(
        create: (BuildContext context) => AnnouncementsBloc(),
      ),
      BlocProvider<AppliedjobsBloc>(
        create: (BuildContext context) => AppliedjobsBloc(),
      ),
      BlocProvider<IntroBloc>(
        create: (BuildContext context) => IntroBloc(),
      ),
      BlocProvider<ChatBloc>(
        create: (BuildContext context) => ChatBloc(),
      ),
      BlocProvider<LocationBloc>(
        create: (BuildContext context) => LocationBloc(),
      ),
      BlocProvider<RankBloc>(
        create: (BuildContext context) => RankBloc(),
      ),
    ];
  }
}
