
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_pic_event.dart';
part 'upload_pic_state.dart';

class UploadPicBloc extends Bloc<UploadPicEvent, UploadPicState> {
  UploadPicBloc() : super(UploadPicInitial(picdata: {})) {
    final picker = ImagePicker();
    Map data = {};
    on<Selectpic>((event, emit) async {
      if (event.source == ImageSource.gallery) {

        FilePickerResult? file = await FilePicker.platform.pickFiles(

          type: FileType.custom,
          allowedExtensions: [
                  'pdf',
                  'docx',
                  'doc',
                  'jpeg',
                  'jpg',
                  'png'
                ], //here you can add any of extention what you need to pick


        );


          if (file!.files[0].path!.isNotEmpty) {
            data[event.key] = file.files[0].path;
            print(" dskjfh  $data");
            emit(SelectPicSuccess(picdata: data));

        }
      } else {
        final image = await picker.pickImage(source: event.source);

        if (image!.path.isNotEmpty) {
          data[event.key] = image.path;
          print(" dskjfh  $data");
          emit(SelectPicSuccess(picdata: data));
        }
      }
    });

    on<SelectResume>((event, emit) async {
        FilePickerResult? file = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions:[
            'pdf',
            'docx',
            'doc',
          ], //here you can add any of extention what you need to pick
        );
        if (file!.files[0].path!.isNotEmpty) {
          data[event.key] = file.files[0].path;
          print(" dskjfh  $data");
          emit(SelectPicSuccess(picdata: data));
        }
    });
    on<ProfileSelect>((event, emit) async {

      // final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(
      //     FaceDetectorOptions(performanceMode:FaceDetectorMode.accurate,enableLandmarks:true,enableClassification:true,enableTracking:true,enableContours:true)
      // );

      final image = await picker.pickImage(source: event.source);

        if (image!.path.isNotEmpty) {
          // final inputImage = InputImage.fromFile(File(image.path));
          // final faces = await faceDetector.processImage(inputImage);
          // final faces1 = await faceDetector.options.minFaceSize;



            data[event.key] = image.path;
            emit(SelectPicSuccess(picdata: data));
          }

    });
  }
}
