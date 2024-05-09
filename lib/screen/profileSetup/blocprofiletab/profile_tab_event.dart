part of 'profile_tab_bloc.dart';

@immutable
abstract class ProfileTabEvent {}

class TabChange extends ProfileTabEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}