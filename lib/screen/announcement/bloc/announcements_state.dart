part of 'announcements_bloc.dart';

@immutable
abstract class AnnouncementsState {}

class AnnouncementsInitial extends AnnouncementsState {}
class Announcementsload extends AnnouncementsState {}
class Announcementsloded extends AnnouncementsState {
  final AnnouncementsModel announcementsModel;

  Announcementsloded(this.announcementsModel);
}
class AnnouncementsError extends AnnouncementsState {
  final String error;

  AnnouncementsError(this.error);
}
