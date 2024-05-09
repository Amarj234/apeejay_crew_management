
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../utils/pin_style.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import 'bloc/timer_bloc.dart';


class EmailOtp extends StatefulWidget {
  const EmailOtp({super.key, required this.otp, required this.email});
final String otp;
final String email;
  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {


  TextEditingController emailotp=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // emailotp.text=widget.otp;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<TimerBloc, TimerState>(
  builder: (context, state) {
    if(state is OtpLoad){
      return const Center(child: CircularProgressIndicator(),);
    }
    if(state is Emailotpsent) {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
          child: SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                const SizedBox(height: 30,),
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
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
                const SizedBox(height: 10,)
                , TextButton(onPressed: () {
                  context.read<TimerBloc>().add(SendEmailotp(widget.email));
                }, child: Text(
                    "Resend Code", style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff2E8B57)))),
                const SizedBox(height: 10,),
                AppButton(
                  hight: 49,
                  width: 130,
                  color: Colors.black,
                  myfun: () {
                    context.read<TimerBloc>().add(
                        VerifyEmail(widget.email, emailotp.text));
                  },
                  mystyle: style18w600w,
                  name: "VERIFY",
                ),

              ],
            ),
          ),),
        ),
      );
    }
    return Container();
  }, listener: (BuildContext context, TimerState state) {
        if(state is Emailotpsent){
          emailotp.text=state.emailOtp.data!.emailOtp.toString();

        }
      },
),
    );
  }
}
