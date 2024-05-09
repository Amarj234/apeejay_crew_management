part of 'dropdown_bloc.dart';

@immutable
abstract class DropdownState {}

class DropdownInitial extends DropdownState {}

class DropdownLoding extends DropdownState {

}

class DropdownSuccess extends DropdownState {
  final DropdownList res;

  DropdownSuccess(this.res);
}

class DropdownError extends DropdownState {
  final String Error;

  DropdownError(this.Error);
}