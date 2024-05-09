import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/phoneOtp.dart';
import '../../../model/phoneVerify.dart';
import '../../../model/userDetails.dart';
import '../../otp/phone_otp.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    String code="+91";
    on<Login>((event, emit) async {
      code=event.countryCode;
      emit(Loginload());
      try {
        var res = await Api().postReq({
          "phone": event.phone,
          "phone_code": event.countryCode,
        }, "login");
        PhoneOtp api = PhoneOtp.fromJson(jsonDecode(res!.body));
        if (api.status == true) {
          emit(LoginSuccess(api));
          Navigator.push(
              event.context,
              MaterialPageRoute(
                  builder: (context) => PhoneOtpScreen(
                        otp: api.data!.otp.toString(),
                        phone: event.phone,
                      )));
        }
      } catch (e) {
        emit(LoginErrror("$e"));
      }
    });



    on<Resend>((event, emit) async {

      try {
        var res = await Api().postReq({
          "phone": event.phone,
          "phone_code": code,
        }, "login");
        PhoneOtp api = PhoneOtp.fromJson(jsonDecode(res!.body));
        if (api.status == true) {
          emit(LoginSuccess(api));

        }
      } catch (e) {
        emit(LoginErrror("$e"));
      }
    });


    on<LoginVerify>((event, emit) async {
      emit(Loginload());
      try {
        var res = await Api().postReq({
          "otp": event.otp,
          "phone": event.phone,
        }, "verify-otp");

        var data = jsonDecode(res!.body);
        if (data['status'] == true) {
          PhoneVerify api = PhoneVerify.fromJson(data);

          emit(VerifySuccess(api));
        } else {
          emit(InvalidOtp(data['message'].toString()));
        }
      } catch (e) {
        emit(LoginErrror("$e"));
      }
    });
    on<LoginData>((event, emit) async {
      emit(Loginload());
      try {
        var res = await Api().getReq("user-details");
        UserDetails api = UserDetails.fromJson(jsonDecode(res!.body));
        final fcmToken = await FirebaseMessaging.instance.getToken();
        await Api().postReq({
          "fcm_token":fcmToken,
        },"update-fcm-token");

        emit(ProfileDataSuccess(api));
      } catch (e) {
        emit(LoginErrror("$e"));
      }
    });

    // TODO: implement event handler
  }
}
