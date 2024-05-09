part of 'bloctab_bloc.dart';

@immutable
abstract class LandingPageEvent {}

class TabChange extends LandingPageEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}

