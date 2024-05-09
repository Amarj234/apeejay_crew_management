import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../commonfun/api_request.dart';
import '../../../model/registerError.dart';
import '../../../model/register_responce.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoding());
      try {
        var res = await Api().postReq({
          "phone": event.phone,
          "email": event.email,
          "phone_code": event.cuntry,
          "indos_number": event.indos,
          "dob": event.dob
        }, "register");
        var data = jsonDecode(res!.body);
        if (data['status']) {
          RegisterResponce api = RegisterResponce.fromJson(data);
          emit(RegisterSuccess(api));
        } else {
          RegisterError1 api = RegisterError1.fromJson(data);
          emit(RegisterfiedlsError(api));
        }
      } catch (e) {
        print("$e");
        emit(RegisterError("$e"));
      }
    });
  }
}
