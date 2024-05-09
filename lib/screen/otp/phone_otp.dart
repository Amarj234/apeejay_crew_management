import 'dart:async';

import 'package:apeejay_crew_management/home_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../config/sharedPrefs.dart';
import '../../utils/pin_style.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../login/loginbloc/login_bloc.dart';
import '../register/register_form.dart';

class PhoneOtpScreen extends StatefulWidget {
  const PhoneOtpScreen({super.key, required this.otp, required this.phone});
  final String otp;
  final String phone;

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  TextEditingController phoneotp = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // phoneotp.text = widget.otp.toString();
    startOtp();
  }

  StreamController<int> minuts = StreamController.broadcast();
  startOtp() {
    Timer? timer;
    int inds = 45;
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (inds <= 0) {
        minuts.sink.add(inds);
        timer?.cancel();
        // Timer completed, perform additional actions here
      } else {
        inds--;
        minuts.sink.add(inds);
        //  await future.whenComplete(() =>  emit(Secendstart(inds)));
      }
    });
  }

  UserPrefs prefs = UserPrefs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: SafeArea(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
               // phoneotp.text = state.phoneOtp.data!.otp.toString();
              }
              if (state is VerifySuccess) {
                if (state.verify.data!.userStatus == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterForm(
                                phone: widget.phone,
                              )));
                } else {
                  EasyLoading.showSuccess(state.verify.message.toString());

                  prefs.setData("token", state.verify.data!.token.toString());
                  context.read<LoginBloc>().add(LoginData());
                }
              }
              if (state is ProfileDataSuccess) {
                prefs.setData(
                    "phone", state.userDetails.data!.details!.phone.toString());
                prefs.setData(
                    "id", state.userDetails.data!.details!.id.toString());
                prefs.setData(
                    "name", state.userDetails.data!.details!.name.toString());
                prefs.setData("profilePhoto",
                    state.userDetails.data!.details!.profilePhoto.toString());
                prefs.setData(
                    "email", state.userDetails.data!.details!.email.toString());
                prefs.setData("login", "yes");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 2,
                            )));
              }

              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is Loginload) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is LoginErrror) {
                return Center(
                  child: Text(state.error),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(top: 150.0, right: 20, left: 20),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    AutoSizeText(
                      "Verify Phone",
                      style: style28w400b,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      "Code has been send to ${widget.phone} ",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff545454)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 56,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Pinput(
                        followingPinTheme: followingPinTheme,
                        controller: phoneotp,
                        defaultPinTheme: defaultPinTheme,
                        // focusedPinTheme: activePinTheme,
                        submittedPinTheme: submittedPinTheme,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AutoSizeText(
                      "Didn’t get OTP Code?",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff545454)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<int>(
                      stream: minuts.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(); // Display a loading indicator when waiting for data.
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error: ${snapshot.error}'); // Display an error message if an error occurs.
                        } else if (snapshot.data == 0) {
                          return TextButton(
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(Resend(phone: widget.phone));
                                startOtp();
                              },
                              child: Text("Resend Code",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(
                                          0xff2E8B57)))); // Display a message when no data is available.
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Request again in :",
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "00:${snapshot.data.toString()}",
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ); // Display the latest number when data is available.
                        }
                      },
                    ),
                    if (state is InvalidOtp) ...[
                      Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      )
                    ],
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AppButton(
                          hight: 49,
                          width: 130,
                          color: Colors.black,
                          myfun: () {
                            context.read<LoginBloc>().add(LoginVerify(
                                phone: widget.phone, otp: phoneotp.text));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>  FaceDetectorView()));
                          },
                          mystyle: style18w600w,
                          name: "VERIFY",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
