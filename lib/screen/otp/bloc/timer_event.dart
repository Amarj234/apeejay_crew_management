part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}



class Starttimer extends TimerEvent{
}

class Stoptimer extends TimerEvent{
}

class SendEmailotp extends TimerEvent{
  final String email;
  SendEmailotp(this.email);
}
class VerifyEmail extends TimerEvent{
  final String email;
  final String otp;
  VerifyEmail(this.email, this.otp);
}




class Resend extends TimerEvent{
final String email;
final String phone;

  Resend(this.email, this.phone);

}
class VerifyOtp extends TimerEvent{
final String emailotp;
final String phoneotp;
final String phoneno;
VerifyOtp(this.emailotp, this.phoneotp,this.phoneno);

}



