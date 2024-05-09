part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}
class IntroLoad extends IntroState {}
class IntroLoded extends IntroState {
  final SplaceText splaceText;

  IntroLoded(this.splaceText);
}
class IntroError extends IntroState {
  final String error;

  IntroError(this.error);
}
