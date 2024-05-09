part of 'upload_pic_bloc.dart';

@immutable
abstract class UploadPicEvent {}


class Selectpic extends UploadPicEvent{
final String key;
ImageSource source;
BuildContext context;

  Selectpic(this.key,this.source,this.context);
}
class ProfileSelect extends UploadPicEvent{
final String key;
ImageSource source;
BuildContext context;

ProfileSelect(this.key,this.source,this.context);
}

class SelectResume extends UploadPicEvent{
  final String key;



SelectResume(this.key,);
}