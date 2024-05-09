import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/splace_text.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<IntroEvent>((event, emit) async {
      emit(IntroLoad());
      try {
        var res = await Api().getReq("cms-details");
        SplaceText api = SplaceText.fromJson(jsonDecode(res!.body));

        emit(IntroLoded(api));
      } catch (e) {
        emit(IntroError("$e"));
      }
      // TODO: implement event handler
    });
  }
}
