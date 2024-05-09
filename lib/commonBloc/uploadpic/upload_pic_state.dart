part of 'upload_pic_bloc.dart';

@immutable
abstract class UploadPicState {
  final Map picdata;

  UploadPicState({required this.picdata});

}

class UploadPicInitial extends UploadPicState {
  UploadPicInitial({required super.picdata});

}


class SelectPicSuccess extends UploadPicState {
   SelectPicSuccess({required super.picdata});


}
