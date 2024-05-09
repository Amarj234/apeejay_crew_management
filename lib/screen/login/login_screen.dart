import 'dart:io';

import 'package:apeejay_crew_management/screen/login/loginbloc/login_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/costum_snackbar.dart';
import '../commonwidget/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int waitForSecondBackPress = 2;
  int onFirstBackPress = 1;
   String countryCode = "+91";

  void resetBackTimeout() {
    Future.delayed(const Duration(seconds: 2), () {
      onFirstBackPress = 1;
    });
  }
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.otp),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if(state is Loginload){
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          AutoSizeText(
                            "Enter Your Mobile Number",
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            "We will send you a Confirmation Code",
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFields(

                            textcolor: Colors.white,
                            isred: true,
                            fillcolor: const Color(0xffB7000B),
                            bordercolor: const Color(0xffB5C6C4),
                            hint: 'Mobile Number',
                            mycon: phone, cuntryFun: (String? val) {
                             countryCode = val??"+91";

                          },

                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          AutoSizeText(
                            "Securing your personal information is our priority ",
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),

                          Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: AppButton(
                                  width: 139,
                                  hight: 49,
                                  color: Colors.black,
                                  myfun: () {

                                    final isValid = _formKey.currentState!
                                        .validate();
                                    if (!isValid) {
                                      return;
                                    }
                                    context.read<LoginBloc>().add(
                                        Login(countryCode,phone: phone.text, context: context));
                                  },
                                  mystyle: style18w500w,
                                  name: "Get OTP",
                                ),)),

                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  Container myage(String age) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xffB5C6C4),
          )
      ),
      child: Text(age),
    );
  }
}
