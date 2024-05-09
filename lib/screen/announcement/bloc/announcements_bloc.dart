import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/announcements_model.dart';

part 'announcements_event.dart';
part 'announcements_state.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  AnnouncementsBloc() : super(AnnouncementsInitial()) {

    bool isrequest =true;
    on<Getannouncement>((event, emit) async {
      // TODO: implement event handler
      if(isrequest) {
        isrequest=false;
        emit(Announcementsload());
        try {
          var res = await Api().getReq("announcement-list");
          if (res!.statusCode == 200) {
            AnnouncementsModel api = AnnouncementsModel.fromJson(
                jsonDecode(res.body));
            emit(Announcementsloded(api));
            isrequest=true;
          } else {
            isrequest=true;
            // EasyLoading.showError("Error Status code ${res.statusCode}");
          }
        } catch (e) {
          isrequest=true;
          emit(AnnouncementsError("$e"));
        }
      }
    });
  }
}
