part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class NotificationLoad extends NotificationState {}
class NotificationLoded extends NotificationState {
  final NotificationModel notificationModel;
  NotificationLoded(this.notificationModel);
}
class NotificationError extends NotificationState {
  final String error;

  NotificationError(this.error);
}
class NotificationRead extends NotificationState {}

class NotificationCountread extends NotificationState {
 final CountNotification countNotification;

  NotificationCountread(this.countNotification);

}
