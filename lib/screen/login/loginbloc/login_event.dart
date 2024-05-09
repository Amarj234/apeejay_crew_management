part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class Login extends LoginEvent{
  final String phone;
  final String countryCode;
  final BuildContext context;

  Login(this.countryCode, {required this.phone,required this.context});
}
class Resend extends LoginEvent{
  final String phone;

  Resend({required this.phone});
}

class LoginData extends LoginEvent{

}
class LoginVerify extends LoginEvent{
final String otp;
final String phone;

  LoginVerify({required this.otp, required this.phone});


}