part of 'timer_bloc.dart';

@immutable
abstract class TimerState {

}

class TimerInitial extends TimerState {

}

class Secendstart extends TimerState {
  final int  seconds;
  Secendstart(this.seconds) ;
}

class Secendziro extends TimerState {


}
class LoadState extends TimerState{

}

class SuccessState extends TimerState{
  final RegisterResponce res;

  SuccessState(this.res);
}
class VerifySuccess extends TimerState{
  final RegisterVerify res;

  VerifySuccess(this.res);
}

class ErrorState extends TimerState{
final String error;

  ErrorState(this.error);
}

class OtpLoad extends TimerState{

}

class EmailVerify extends TimerState{

}

class Emailotpsent extends TimerState{
final EmailOtp emailOtp;

  Emailotpsent(this.emailOtp);
}

class ErrorOtp extends TimerState{
  final String error;

  ErrorOtp(this.error);
}


