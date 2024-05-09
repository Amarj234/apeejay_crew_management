part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loginload extends LoginState {}

class LoginSuccess extends LoginState {
  final PhoneOtp phoneOtp;
  LoginSuccess(this.phoneOtp);
}
class VerifySuccess extends LoginState {
  final PhoneVerify verify;
  VerifySuccess(this.verify);
}

class Verifyotp extends LoginState {
  final PhoneOtp phoneOtp;
  Verifyotp(this.phoneOtp);
}


class ProfileDataSuccess extends LoginState {
  final UserDetails userDetails;

  ProfileDataSuccess(this.userDetails);

}

class LoginErrror extends LoginState {
  final String error;

  LoginErrror(this.error);
}

class InvalidOtp extends LoginState {
  final String error;

  InvalidOtp(this.error);
}