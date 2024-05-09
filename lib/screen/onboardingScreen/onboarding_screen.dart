import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../config/sharedPrefs.dart';
import '../../home_screen.dart';
import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../introScreen/bloc/intro_bloc.dart';
import '../introScreen/intro_screen.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    super.key,
  });

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // TODO: implement initState
    super.initState();
context.read<IntroBloc>().add(Getintro());
    Future.delayed(const Duration(seconds: 2), () {
      determineScreen();
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const SelectRegister()));
      // // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  UserPrefs prefs = UserPrefs();
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  determineScreen() async {


    Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });

    //prefs.clearPrefs();
    String? token = prefs.getToken();
    String? fcmtoken = prefs.getFCMToken();

    String? login = prefs.getData("login");
    String? name = prefs.getData("name");
    // final pro = Provider.of<HometabProvider>(context, listen: false);

    log(" token : $token name: $name fcm $fcmtoken");
//initAutoStart();
    context.read<DropdownBloc>().add(GetdropdownEvent());

    if (login == "yes") {
      // pro.changeUid(rid);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen(index: 2,)));

    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const IntroScreen()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Center(child: Image.asset(AssetImages.splace)),
    );
  }
}
