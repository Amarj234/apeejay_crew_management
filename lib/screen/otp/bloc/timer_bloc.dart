import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/emailOtp.dart';

import '../../../model/register_responce.dart';
import '../../../model/register_verify.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<Starttimer>((event, emit) {
      Timer? timer;
      int inds = 45;

      /// triggers the TimerRunInProgress state

      /// makes the subscription listen to TimerTicked state

      timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        if (inds <= 0) {
          emit(Secendziro());
          timer?.cancel();
          // Timer completed, perform additional actions here
        } else {
          inds--;
          emit(Secendstart(inds));
          //  await future.whenComplete(() =>  emit(Secendstart(inds)));
        }
      });

      // TODO: implement event handler
    });

    on<Resend>((event, emit) async {
      emit(LoadState());
      try {
        var res = await Api().postReq({
          "phone": event.phone,
          "email": event.email,
        }, "resend-code");
        RegisterResponce api = RegisterResponce.fromJson(jsonDecode(res!.body));

        emit(SuccessState(api));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<VerifyOtp>((event, emit) async {
      emit(OtpLoad());
      try {
        var res = await Api().postReq({
          "phone": event.phoneno,
          "email_otp": event.emailotp,
          "otp": event.phoneotp,
        }, "register-verify");
        RegisterVerify api = RegisterVerify.fromJson(jsonDecode(res!.body));

        emit(VerifySuccess(api));
        if (api.status == true) {
          emit(VerifySuccess(api));
        } else {
          emit(ErrorOtp(api.message));
        }
      } catch (e) {
        emit(ErrorOtp("$e"));
      }
    });

    on<SendEmailotp>((event, emit) async {
      EasyLoading.showInfo("Wait For Email Otp");
      try {
        var res = await Api().postReq({
          "email": event.email,
        }, "email-change");
        var data = jsonDecode(res!.body);
        if (data['status'] == true) {
          EmailOtp api = EmailOtp.fromJson(data);
          emit(Emailotpsent(api));
        }else{
          EasyLoading.showInfo(data['message']);
        }
      } catch (e) {
        EasyLoading.showInfo('$e');
        //  emit(ErrorState("$e"));
      }
    });

    on<VerifyEmail>((event, emit) async {
      emit(OtpLoad());
      try {
        var res = await Api().postReq({
          "email": event.email,
          "email_otp": event.otp,
        }, "email-verify");
        var data = jsonDecode(res!.body);
        if (data['status'] == true) {

          emit(EmailVerify());
        } else {
          EasyLoading.showError('Invalid otp');
        }
      } catch (e) {
        emit(ErrorOtp("$e"));
      }
    });
  }
}
