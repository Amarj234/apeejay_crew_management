import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../utils/constimage.dart';
import '../../utils/pin_style.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../profileSetup/profile_form.dart';
import 'bloc/timer_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key,
      this.emailotp,
      this.phoneotp,
      required this.email,
      required this.phone,
      required this.dob,
      required this.indos,
      required this.name,
      required this.passport});
  final String? emailotp;
  final String? phoneotp;
  final String email;
  final String phone;
  final String name;
  final String passport;
  final DateTime dob;
  final String indos;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneotp = TextEditingController();
  TextEditingController emailotp = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneotp.text = widget.phoneotp!;
    emailotp.text = widget.emailotp!;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.otp),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, right: 20, left: 20),
              child: BlocConsumer<TimerBloc, TimerState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is SuccessState) {
                  //  phoneotp.text = state.res.data!.otp.toString();
                    emailotp.text = state.res.data!.emailOtp.toString();
                  }

                  if (state is VerifySuccess) {
                    if (state.res.status == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileForm(
                                    name: widget.name,
                                    phone: widget.phone,
                                    email: widget.email,
                                    dob: widget.dob,
                                    indos: widget.indos,
                                    passport: widget.passport,
                                  )));
                    }
                  }
                },
                builder: (context, state) {
                  if (state is OtpLoad) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Verify Phone",
                        style: style28w400b,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        "Code has been send to +9874561230 ",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
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
                        "Verify Email",
                        style: style28w400b,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        "Code has been send to Mail ID",
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
                          controller: emailotp,
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
                        height: 15,
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
                                      .read<TimerBloc>()
                                      .add(Resend(widget.email, widget.phone));
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
                      if (state is ErrorOtp) ...[
                        Center(
                          child: Text(
                            "Invalid Otp",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                      ],
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AppButton(
                          hight: 49,
                          width: 130,
                          color: Colors.black,
                          myfun: () {
                            context.read<TimerBloc>().add(VerifyOtp(
                                emailotp.text, phoneotp.text, widget.phone));
                          },
                          mystyle: style18w600w,
                          name: "VERIFY",
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
