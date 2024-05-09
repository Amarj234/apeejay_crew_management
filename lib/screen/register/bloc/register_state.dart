part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {

}

class RegisterLoding extends RegisterState {

}

class RegisterSuccess extends RegisterState {
final RegisterResponce res;

  RegisterSuccess(this.res);
}

class RegisterError extends RegisterState {
final String Error;

  RegisterError(this.Error);
}
class RegisterfiedlsError extends RegisterState {
final RegisterError1 Errors;

RegisterfiedlsError(this.Errors);
}
