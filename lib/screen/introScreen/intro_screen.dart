
import 'package:apeejay_crew_management/screen/introScreen/IntroScreentow.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../commonfun/customAnimation.dart';
import '../../commonfun/enums.dart';
import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import 'bloc/intro_bloc.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
  }
  permission()async{
    if (await Permission.location.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: BlocBuilder<IntroBloc, IntroState>(
  builder: (context, state) {
    if(state is IntroLoded){
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.intro1),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(top: 100, left: 30, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAnimation(
              direction: Direction.up,
              duration: const Duration(milliseconds: 500),
              child: SvgPicture.asset(
                AssetImages.introtext1,
                width: 250,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomAnimation(
              direction: Direction.right,
              duration: const Duration(milliseconds: 500),
              child: mainHeadin(context,state.splaceText.data!.details!.intro1Description.toString()
              )   ),


            Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child:  AppButton(
                    hight: 49,
                    myfun: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroScreentow()));
                    },
                    mystyle: style18w600b,
                    name: "Skip",
                  ),)),
            const SizedBox(height: 20,),

          ],
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.intro1),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(top: 100, left: 30, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAnimation(
              direction: Direction.up,
              duration: const Duration(milliseconds: 500),
              child: SvgPicture.asset(
                AssetImages.introtext1,
                width: 250,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomAnimation(
              direction: Direction.right,
              duration: const Duration(milliseconds: 500),
              child: mainHeadin(context,
                  "Unlock seamless access to maritime careers. Register easily, apply for exciting positions, and stay connected with Apeejay Shipping. Apeejay Shipping Limited, an Apeejay Surrendra Group Company, a leading name in the maritime industry is the third largest privately owned company in India, is celebrating of its 75th anniversary since its inception on 25th August 1948"),
            ),


            Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child:  AppButton(
                      hight: 49,
                      myfun: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntroScreentow()));
                      },
                      mystyle: style18w600b,
                      name: "Skip",
                    ),)),
            const SizedBox(height: 20,),

          ],
        ),
      );
  },
),
    );
  }

  Widget mainHeadin(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 90,
          child: AutoSizeText(
            text,
            style: style18w400w,
          ),
        )
      ],
    );
  }
}
