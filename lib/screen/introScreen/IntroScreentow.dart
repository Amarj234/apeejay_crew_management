import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../commonfun/customAnimation.dart';
import '../../commonfun/enums.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../login/login_screen.dart';
import 'bloc/intro_bloc.dart';

class IntroScreentow extends StatelessWidget {
  const IntroScreentow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.green,
      body: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
          if (state is IntroLoded) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetImages.intro2),
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
                      AssetImages.introtext2,
                      width: 250,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomAnimation(
                      direction: Direction.right,
                      duration: const Duration(milliseconds: 500),
                      child: mainHeadin(context,
                          state.splaceText.data!.details!.intro2Description.toString())),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: AppButton(
                          hight: 49,
                          myfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
                image: AssetImage(AssetImages.intro2),
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
                    AssetImages.introtext2,
                    width: 250,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomAnimation(
                    direction: Direction.right,
                    duration: const Duration(milliseconds: 500),
                    child: mainHeadin(context,
                        "Navigate your career path effortlessly with Apeejay Shipping. Our Crew Management App is your direct link to exciting job opportunities in the maritime industry.")),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: AppButton(
                        hight: 49,
                        myfun: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        mystyle: style18w600b,
                        name: "Skip",
                      ),)),
                const SizedBox(height: 20,),
              ],
            ),
          );
        }

      ),
    );
  }

  Widget mainHeadin(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width - 90,
          child: AutoSizeText(
            text,
            style: style18w400w,
          ),
        )
      ],
    );
  }
}
