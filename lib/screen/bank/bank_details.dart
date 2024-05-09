import 'dart:convert';

import 'package:apeejay_crew_management/screen/commonwidget/select_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/register_textfields.dart';
import '../commonwidget/test_drop.dart';
import '../commonwidget/textfield.dart';
import '../commonwidget/upload_button.dart';
import '../document/document_upload.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final name = TextEditingController();
  final phone = TextEditingController();
  String? relation;

  void showImagePickerOptions(String key) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SelectImage(keyid: key);
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  String? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //  height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.availabilitybg),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Next of Kin",
                    style: style28w400b,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AutoSizeText(
                    "Fill up the form for your Kin",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff545454)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RegisterTextfields(
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
                          iswhite: true,
                          bordercolor: const Color(0xffB5C6C4),
                          textcolor: const Color(0xff545454),
                          fillcolor: Colors.white.withOpacity(.1),
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
                  TextFields(
                    bordercolor: const Color(0xffB5C6C4),
                    hint: 'Mobile Number',
                    mycon: phone, cuntryFun: (String? val) {  },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AutoSizeText(
                    "Bank Details",
                    style: style28w400b,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<UploadPicBloc, UploadPicState>(
                    builder: (context, state) {
                      return AutoSizeText(
                        "Upload your bank details",
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff545454)),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<UploadPicBloc, UploadPicState>(
                    builder: (context, state) {
                      return UploadButton(
                        myfun: () {
                          showImagePickerOptions("kin_upload1");
                        },
                        txt:
                            state.picdata['kin_upload1']?.split("/").last ?? 'Upload Cheque Leaf',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 10.0,
                              ),
                            ]),
                        child: const Text(
                          "or",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<UploadPicBloc, UploadPicState>(
                    builder: (context, state) {
                      return UploadButton(
                        myfun: () {
                          showImagePickerOptions("kin_upload2");
                        },
                        txt: state.picdata['kin_upload2']?.split("/").last  ??
                            'Upload Passbook Front Page',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AppButton(
                      width: 133,
                      color: Colors.black,
                      myfun: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) {
                          return;
                        }
                        Map data = {
                          "kin_name": name.text,
                          "kin_relation": relation,
                          "kin_phone": phone.text,
                        };
                        data.removeWhere((key, value) {
                          return value == null || value == "";
                        });
                        UserPrefs().setData("bank", jsonEncode(data));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DocumentUpload()));
                      },
                      mystyle: style18w500w,
                      name: "SUBMIT",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
