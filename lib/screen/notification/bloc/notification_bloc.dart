import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/count_notification.dart';
import '../../../model/notification_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<GetNotification>((event, emit) async {
      // TODO: implement event handler
      emit(NotificationLoad());
      try {
        var res = await Api().getReq("notification-list");
        NotificationModel api = NotificationModel.fromJson(jsonDecode(res!.body));
        emit(NotificationLoded(api));

      } catch (e) {
        emit(NotificationError("$e"));
      }
    });

    on<CountNotificationevent>((event, emit) async {
      // TODO: implement event handler
      emit(NotificationInitial());
      try {
        var res = await Api().getReq("unread-notification-count");
        CountNotification api = CountNotification.fromJson(jsonDecode(res!.body));

        emit(NotificationCountread(api));
      } catch (e) {
        emit(NotificationError("$e"));
      }
    });


    on<RedNotificationevent>((event, emit) async {
      // TODO: implement event handler
      try {
            await Api().postReq({
              "id":event.id,
            },"notification-marked-read");
      } catch (e) {
        emit(NotificationError("$e"));
      }
    });



  }
}
