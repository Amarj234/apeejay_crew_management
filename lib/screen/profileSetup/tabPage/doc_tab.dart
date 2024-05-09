import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../../config/sharedPrefs.dart';
import '../../../utils/color.dart';
import '../../../utils/constimage.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';
import '../../commonwidget/select_image.dart';
import '../../commonwidget/upload_button.dart';
import '../submit/submit_bloc.dart';



class DocTab extends StatefulWidget {
  const DocTab({super.key});

  @override
  State<DocTab> createState() => _DocTabState();
}

class _DocTabState extends State<DocTab> {
  final  name=TextEditingController();
  final  phone=TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();

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
    return Container(
      color: AppColor.green,
      child: BlocBuilder<UploadPicBloc, UploadPicState>(

  builder: (context, state) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.only( left: 20,right: 20),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [





                AutoSizeText(
                  "Passport",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("passport");
                },
                  txt: state.picdata["passport"]?.split("/").last ??'Upload Passport',iswcolor: true,),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "CDC",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("cdc");
                },
                    txt: state.picdata["cdc"]?.split("/").last ??'Upload CDC',iswcolor: true),



                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "INDOS",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("indos");
                },
                    txt: state.picdata["indos"]?.split("/").last ??'Upload INDOS',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "COC",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("coc");
                },
                    txt: state.picdata["coc"]?.split("/").last ??'Upload COC',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "COP / Watch-Keeping",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("cop_watch_keeping");
                },
                    txt: state.picdata["cop_watch_keeping"]?.split("/").last ?? 'Upload COP / Watch-Keeping',iswcolor: true),


                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),


          Container(
            padding: const EdgeInsets.only( left: 20,right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),

                AutoSizeText(
                  "EFA / MFA / MEDICARE",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("efa_mfa_medicare");
                },
                  txt: state.picdata["efa_mfa_medicare"]?.split("/").last ??'Upload EFA / MFA / MEDICARE',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "PST / PSCRB",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("pst_pscrb");
                },
                  txt: state.picdata["pst_pscrb"]?.split("/").last ??'Upload PST / PSCRB',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "FPFF / AFF",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("fpff_aff");
                },
                  txt: state.picdata["fpff_aff"]?.split("/").last ??'Upload FPFF / AFF',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "PSSR",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("pssr");
                },
                  txt: state.picdata["pssr"]?.split("/").last ??'Upload PSSR',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "SSO",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("sso_stsdsd");
                },
                  txt: state.picdata["sso_stsdsd"]?.split("/").last ??'Upload SSO',),

                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),



          Container(
            padding: const EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 30,
                ),

                AutoSizeText(
                  "SSO / STSDSD",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("sso_stsdsd");
                },
                    txt: state.picdata["sso_stsdsd"]?.split("/").last ??'Upload SSO / STSDSD',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "GOC",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("goc");
                },
                    txt: state.picdata["goc"]?.split("/").last ?? 'Upload GOC',iswcolor: true),



                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "GMDSS Endorsement",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("gmdss_endorsement");
                },
                    txt: state.picdata["gmdss_endorsement"]?.split("/").last ??'Upload GMDSS Endorsement',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "SID",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("sid");
                },
                    txt: state.picdata["sid"]?.split("/").last ??'Upload SID',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "Yellow Fever",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("yellow_fever");
                },
                    txt: state.picdata["yellow_fever"]?.split("/").last ??'Upload Yellow Fever',iswcolor: true),


                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),




          Container(
            padding: const EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                AutoSizeText(
                  "ROC",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("roc");
                },
                  txt: state.picdata["roc"]?.split("/").last ?? 'Upload ROC',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "ARPA",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("arpa");
                },
                  txt: state.picdata["arpa"]?.split("/").last ?? 'Upload ARPA',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "RANSCO",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("ransco");
                },
                  txt: state.picdata["ransco"]?.split("/").last ?? 'Upload RANSCO',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "BTM",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("btm");
                },
                  txt: state.picdata["btm"]?.split("/").last ??'Upload BTM',),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "BRM",
                  style: style16w500b,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("brm");
                },
                  txt: state.picdata["brm"]?.split("/").last ??'Upload BRM',),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only( left: 20,right: 20),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 30,
                ),

                AutoSizeText(
                  "ECDIS",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("ecdis");
                },
                    txt: state.picdata["ecdis"]?.split("/").last ??'Upload ECDIS',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "ERS",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("ers");
                },
                    txt: state.picdata["ers"]?.split("/").last ?? 'Upload ERS',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "High Voltage",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("high_voltage");
                },
                    txt: state.picdata["high_voltage"]?.split("/").last ?? 'Upload High Voltage',iswcolor: true),


                const SizedBox(
                  height: 15,
                ),

                AutoSizeText(
                  "Covid 19 Vac",
                  style: style16w500w,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadButton( myfun: () {
                  showImagePickerOptions("covid_19_vac");
                },
                    txt: state.picdata["covid_19_vac"]?.split("/").last ??'Upload Covid 19 Vac',iswcolor: true),
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
  },
),
    );
  }
}
