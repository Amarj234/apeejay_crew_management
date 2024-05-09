
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/chat_history.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<GetChathis>((event, emit) async {
      // TODO: implement event handler
      emit(ChatLoading());
      try {
        var res = await Api().getReq("chat-history");
        if(res!.statusCode==200){
          ChatHistory chatHistory = ChatHistory.fromJson(jsonDecode(res.body));
          emit(ChatLoaded(chatHistory));
        }else{
         // EasyLoading.showError("Error Status code ${res.statusCode}");
        }

      } catch (e) {
        emit(ChatError("$e"));
      }
    });

    on<SendMessage>((event, emit) async {
      try {
         await Api().postReq({
          "message": event.val,
        }, "send-message");
      } catch (e) {

      }
    });



  }

}
