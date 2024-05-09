part of 'profile_tab_bloc.dart';

@immutable
abstract class ProfileTabState {
  final int tabIndex;

  const ProfileTabState({required this.tabIndex});
}

class ProfileTabInitial extends ProfileTabState {
  const ProfileTabInitial({required super.tabIndex});
}


