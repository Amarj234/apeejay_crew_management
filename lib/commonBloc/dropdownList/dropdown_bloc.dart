import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../commonfun/api_request.dart';
import '../../model/dropdown_list.dart';


part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownInitial()) {
    on<GetdropdownEvent>((event, emit) async{
      // TODO: implement event handler
      // TODO: implement event handler
      emit(DropdownLoding());
      try {
        var res = await Api().getReq("dropdown-list");
        DropdownList api = DropdownList.fromJson(jsonDecode(res!.body));

        emit(DropdownSuccess(api));

      } catch (e) {
        emit(DropdownError("$e"));
      }
    });
  }
}
