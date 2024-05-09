part of 'submit_bloc.dart';

@immutable
abstract class SubmitState {}

class SubmitInitial extends SubmitState {}


class Submitload extends SubmitState {}
class Profileload extends SubmitState {}
class Profileloaded extends SubmitState {
 final UserDetails? userDetails;
  Profileloaded(this.userDetails);
}

class SubmitSuccess extends SubmitState {}

class SubmitError extends SubmitState {
 final String msg;
  SubmitError(this.msg);
}

class ProfileError extends SubmitState {
 final String msg;
 ProfileError(this.msg);
}

