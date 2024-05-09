import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../utils/color.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key, required this.keyid});
final String keyid;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(
            Icons.camera,
            color: AppColor.main,
          ),
          title: const Text('Take Photo'),
          onTap: ()async {
    if(keyid=="profile_photo"){
    context.read<UploadPicBloc>().add(ProfileSelect(keyid, ImageSource.camera, context));
    }else {
      context.read<UploadPicBloc>().add(
          Selectpic(keyid, ImageSource.camera, context));
    }
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.image,
            color: AppColor.main,
          ),
          title: const Text('Pick from Gallery'),
          onTap: () {
            if(keyid=="profile_photo"){
              context.read<UploadPicBloc>().add(ProfileSelect(keyid, ImageSource.gallery, context));
            }else {
              context.read<UploadPicBloc>().add(
                  Selectpic(keyid, ImageSource.gallery, context));
              print(context
                  .read<UploadPicBloc>()
                  .state);
            }
              Navigator.pop(context);

          },
        ),
      ],
    );
  }
}
