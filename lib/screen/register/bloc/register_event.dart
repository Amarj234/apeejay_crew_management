part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class Register extends RegisterEvent {
  final String cuntry;
final String phone;
final BuildContext context;
final String email;
final String indos;
final String dob;
  Register( {required this.cuntry,required this.phone, required this.email, required this.indos, required this.dob,required this.context, });
}

