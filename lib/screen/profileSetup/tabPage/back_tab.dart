import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../../config/sharedPrefs.dart';
import '../../../utils/color.dart';
import '../../../utils/constimage.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';
import '../../commonwidget/register_textfields.dart';
import '../../commonwidget/select_image.dart';
import '../../commonwidget/test_drop.dart';
import '../../commonwidget/upload_button.dart';
import '../submit/submit_bloc.dart';



class BankTab extends StatefulWidget {
  const BankTab({super.key});

  @override
  State<BankTab> createState() => _BankTabState();
}

class _BankTabState extends State<BankTab> {


String? relation;
  final  name=TextEditingController();
  final  phone=TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
@override
void initState() {
  // TODO: implement initState
  super.initState();
  var state1=BlocProvider.of<SubmitBloc>(context,listen: false).state;
  if (state1 is Profileloaded) {
    var data = state1.userDetails?.data?.details;
    name.text = data!.kinName??"";
    if(data.kinRelation !=null) {
      relation = data.kinRelation??"";
    }
  }
}
void showImagePickerOptions(String key) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SelectImage(keyid: key);
    },
  );
}
  @override
  Widget build(BuildContext context) {

    var state2 = context.watch<UploadPicBloc>().state;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Next of Kin",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              RegisterTextfields(

                textcolor: Colors.white,fillcolor: Colors.white.withOpacity(.1),
                bordercolor: const Color(0xffB5C6C4),
                mycon: name,
                hint: "Name",
                isvalid: 3,
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<DropdownBloc, DropdownState>(
                builder: (context, state) {
                  if (state is DropdownSuccess) {
                    return TestDrop(
                      textcolor: Colors.white,fillcolor: Colors.white.withOpacity(.1),
                      bordercolor: const Color(0xffB5C6C4),
                      list: state.res.data!.relationships??[],
                      mayfun: (String? val) {
                        relation = val;
                        setState(() {});
                      },
                      hint: 'Relationship',
                      selectedValue: relation,
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              const SizedBox(
                height: 25,
              ),


              AutoSizeText(
                "Bank details",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<UploadPicBloc, UploadPicState>(
                builder: (context, state) {
                  return UploadButton(
                    iswcolor: true,
                    myfun: () {
                      showImagePickerOptions("kin_upload1");
                    },
                    txt:
                    state.picdata['kin_upload1']?.split("/").last ?? 'Upload Cheque Leaf',
                  );
                },
              ),

              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 10.0,
                        ),]
                    ),
                    child: const Text("or",style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              BlocBuilder<UploadPicBloc, UploadPicState>(
                builder: (context, state) {
                  return UploadButton(
                    iswcolor: true,
                    myfun: () {
                      showImagePickerOptions("kin_upload2");
                    },
                    txt: state.picdata['kin_upload2']?.split("/").last  ??
                        'Upload Passbook Front Page',
                  );
                },
              ),





            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 40),
          height: 170,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: AppColor.green.withOpacity(1),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    AppColor.green.withOpacity(.5),
                    BlendMode.modulate,)
                  , image: AssetImage(AssetImages.profilebot))),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AppButton(
                width: 135,
                myfun: () {
                  if (state2 is SelectPicSuccess) {
                    UserPrefs().setData(
                        "allimage", jsonEncode(state2.picdata));

                  }
                  Map data = {
                    "kin_name": name.text,
                    "kin_relation": relation,

                  };
                  print(data);
                  data.removeWhere((key, value) {
                    return value == null || value == "";
                  });

                  print(data);
                  UserPrefs().setData("bank", jsonEncode(data));
                    context.read<SubmitBloc>().add(UpdateForm());
                },
                mystyle: style18w600b,
                name: "UPDATE",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
