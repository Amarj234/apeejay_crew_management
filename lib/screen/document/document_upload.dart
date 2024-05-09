import 'dart:convert';
import 'package:apeejay_crew_management/screen/commonwidget/select_image.dart';
import 'package:apeejay_crew_management/screen/profileSetup/submit/submit_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/checkbox_fields.dart';
import '../commonwidget/upload_button.dart';
import '../login/login_screen.dart';

class DocumentUpload extends StatefulWidget {
  const DocumentUpload({super.key});

  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  final name = TextEditingController();
  final phone = TextEditingController();
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
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  bool istrems=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9F4FF),
      body: BlocConsumer<SubmitBloc, SubmitState>(
        listener: (context, state2) {
          // TODO: implement listener
        },
        builder: (context, state2) {
          if (state2 is Submitload) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state2 is SubmitSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetImages.right1),
                  const SizedBox(
                    height: 15,
                  ),
                  AutoSizeText(
                    "Thank you ",
                    style: style28w400b,
                  ),
                  AutoSizeText(
                    "for Register",
                    style: style28w400b,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        width: 180,
                        color: Colors.black,
                        myfun: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        mystyle: style18w500w,
                        name: "Back to Login",
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: BlocBuilder<UploadPicBloc, UploadPicState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Upload All Document",
                              style: style28w400b,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "Upload your personal Document",
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff545454)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AutoSizeText(
                              "**Docs type to be uploaded in PDF, JPEG, size up to  1 MB",
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff2E8B80)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AutoSizeText(
                              "Passport",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("passport");
                              },
                              txt: state.picdata["passport"]?.split("/").last ??
                                  'Upload Passport',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "CDC",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("cdc");
                              },
                              txt: state.picdata["cdc"]?.split("/").last ??
                                  'Upload CDC',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "INDOS",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("indos");
                              },
                              txt: state.picdata["indos"]?.split("/").last ??
                                  'Upload INDOS',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "COC",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                                myfun: () {
                                  showImagePickerOptions("coc");
                                },
                                txt: state.picdata["coc"]?.split("/").last ??
                                    'Upload COC'),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "COP / Watch-Keeping",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("cop_watch_keeping");
                              },
                              txt: state.picdata["cop_watch_keeping"]
                                      ?.split("/")
                                      .last ??
                                  'Upload COP / Watch-Keeping',
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("efa_mfa_medicare");
                              },
                              txt: state.picdata["efa_mfa_medicare"]
                                      ?.split("/")
                                      .last ??
                                  'Upload EFA / MFA / MEDICARE',
                            ),

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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("pst_pscrb");
                              },
                              txt:
                                  state.picdata["pst_pscrb"]?.split("/").last ??
                                      'Upload PST / PSCRB',
                            ),

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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("fpff_aff");
                              },
                              txt: state.picdata["fpff_aff"]?.split("/").last ??
                                  'Upload FPFF / AFF',
                            ),

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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("pssr");
                              },
                              txt: state.picdata["pssr"]?.split("/").last ??
                                  'Upload PSSR',
                            ),

                            // const SizedBox(
                            //   height: 15,
                            // ),
                            //
                            // AutoSizeText(
                            //   "SSO",
                            //   style: style16w500b,
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("sso_stsdsd");
                              },
                              txt: state.picdata["sso_stsdsd"]
                                      ?.split("/")
                                      .last ??
                                  'Upload SSO',
                            ),

                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            AutoSizeText(
                              "SSO / STSDSD",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("sso_stsdsd");
                              },
                              txt: state.picdata["sso_stsdsd"]
                                      ?.split("/")
                                      .last ??
                                  'Upload SSO / STSDSD',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "GOC",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("goc");
                              },
                              txt: state.picdata["goc"]?.split("/").last ??
                                  'Upload GOC',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "GMDSS Endorsement",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("gmdss_endorsement");
                              },
                              txt: state.picdata["gmdss_endorsement"]
                                      ?.split("/")
                                      .last ??
                                  'Upload GMDSS Endorsement',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "SID",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("sid");
                              },
                              txt: state.picdata["sid"]?.split("/").last ??
                                  'Upload SID',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "Yellow Fever",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("yellow_fever");
                              },
                              txt: state.picdata["yellow_fever"]
                                      ?.split("/")
                                      .last ??
                                  'Upload Yellow Fever',
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("roc");
                              },
                              txt: state.picdata["roc"]?.split("/").last ??
                                  'Upload ROC',
                            ),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("arpa");
                              },
                              txt: state.picdata["arpa"]?.split("/").last ??
                                  'Upload ARPA',
                            ),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("ransco");
                              },
                              txt: state.picdata["ransco"]?.split("/").last ??
                                  'Upload RANSCO',
                            ),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("btm");
                              },
                              txt: state.picdata["btm"]?.split("/").last ??
                                  'Upload BTM',
                            ),
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
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("brm");
                              },
                              txt: state.picdata["brm"]?.split("/").last ??
                                  'Upload BRM',
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            AutoSizeText(
                              "ECDIS",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("ecdis");
                              },
                              txt: state.picdata["ecdis"]?.split("/").last ??
                                  'Upload ECDIS',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "ERS",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("ers");
                              },
                              txt: state.picdata["ers"]?.split("/").last ??
                                  'Upload ERS',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "High Voltage",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("high_voltage");
                              },
                              txt: state.picdata["high_voltage"]
                                      ?.split("/")
                                      .last ??
                                  'Upload High Voltage',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AutoSizeText(
                              "Covid 19 Vac",
                              style: style16w500b,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              myfun: () {
                                showImagePickerOptions("covid_19_vac");
                              },
                              txt: state.picdata["covid_19_vac"]
                                      ?.split("/")
                                      .last ??
                                  'Upload Covid 19 Vac',
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(
                        height: 30,
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Terms & Conditions",
                              style: style16w500b,
                            ),


                          ],
                        ),
                      ),

                      CheckboxFormField(title: Text("App Manager can change your data as per requirement",style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w500, color:  Color(0xff595959)),),autovalidate: istrems,initialValue: false,onSaved: (v){
                        print("test $v");
                        istrems=v!;
                        setState(() {

                        });
                      },),

                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            width: 133,
                            color:istrems? Colors.black:Colors.grey,
                            myfun: () {
                              if (state is SelectPicSuccess) {
                                UserPrefs().setData(
                                    "allimage", jsonEncode(state.picdata));

                                  print(state.picdata);
                              }
                              if(istrems) {
                                context.read<SubmitBloc>().add(SubmitForm());
                              }
                              print("Submitload");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const MainPage()));
                            },
                            mystyle: style18w500w,
                            name: "SUBMIT",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                },
              ),
            ),
          ));
        },
      ),
    );
  }
}
