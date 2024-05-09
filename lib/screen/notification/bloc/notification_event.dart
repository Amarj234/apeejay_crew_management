part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}


class GetNotification extends NotificationEvent{

}
class CountNotificationevent extends NotificationEvent{

}

class RedNotificationevent extends NotificationEvent{
  final String id;

  RedNotificationevent(this.id);
}

