import 'dart:io';

import 'package:apeejay_crew_management/utils/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/select_image.dart';
import 'blocprofiletab/profile_tab_bloc.dart';
import 'submit/submit_bloc.dart';
import 'tabPage/avl_tab.dart';
import 'tabPage/back_tab.dart';
import 'tabPage/doc_tab.dart';
import 'tabPage/main_update.dart';
import 'tabPage/safty_tab.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  alertDlog() {
    showGeneralDialog(
      context: context,
      //  barrierColor: Colors.black12.withOpacity(0.6), // Background color
      // barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, __, ___) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: DottedBorder(
                  padding: const EdgeInsets.all(10),
                  strokeWidth: 7,
                  color: Colors.white,
                  dashPattern: const [120, 30],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(125),
                  child: Image.asset(AssetImages.face)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffB81521)),
              child: const Text(
                "It does not seem to be a human being",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decorationColor: Color(0xffB81521),
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            AppButton(
              width: 170,
              hight: 46,
              color: const Color(0xff2E8B80),
              myfun: () {
                Navigator.pop(context);
              },
              mystyle: GoogleFonts.roboto(
                  decorationColor: const Color(0xff2E8B80),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              name: "RE - UPLOAD",
            ),
          ],
        );
      },
    );
  }

  List tab = [
    {"name": "Personal", "icon": AssetImages.person},
    {"name": "Working Gear", "icon": AssetImages.work},
    {"name": "Availability", "icon": AssetImages.avl},
    {"name": "Kin and Bank Details", "icon": AssetImages.bankd},
    {"name": "Document", "icon": AssetImages.doc}
  ];
  List<Widget> myPageList = [
    const MainUpdate(),
    const SaftyTab(),
    AvlTab(),
    const BankTab(),
    const DocTab()
  ];

  List<double> hight = [1250, 500, 500, 650, 650];

  void showImagePickerOptions(String key) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SelectImage(
          keyid: key,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SubmitBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    var state1 = context.watch<SubmitBloc>().state;
    var state2 = context.watch<UploadPicBloc>().state;
    if (state1 is Profileload) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state1 is ProfileError) {
      return Center(
        child: Text(state1.msg),
      );
    }
    if (state1 is Profileloaded) {
      return Scaffold(
        // backgroundColor: AppColor.green,
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<ProfileTabBloc, ProfileTabState>(
              listener: (context, state) {
          
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Container(
                      constraints:
                      const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 1350),
                      margin: const EdgeInsets.only(top: 200),
                     height: hight[state.tabIndex],
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: AppColor.green,
                      ),
                    ),
                    Container(
                      height: 200,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AssetImages.profiletop))),
                      //  child: Image.asset(AssetImages.profilebot,height: 300,width: MediaQuery.of(context).size.width,)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Update Profile",
                            style: style28w400b,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(

                            decoration: BoxDecoration(image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AssetImages.profilepicback)
                            )),
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 122,
                                  width: 111,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                      image: state2.picdata['profile_photo'] != null
                                          ? DecorationImage(
                                              image: FileImage(File(
                                                  state2.picdata['profile_photo'])),
                                              fit: BoxFit.cover)
                                          : DecorationImage(
                                              image: NetworkImage(
                                                  "${state1.userDetails?.data?.profilePhotoBaseUrl}/${state1.userDetails?.data?.details?.profilePhoto}"),
                                              fit: BoxFit.cover)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 100.0, top: 80),
                                    child: InkWell(
                                        onTap: () {
                                          // alertDlog();
                                          showImagePickerOptions("profile_photo");
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            padding: const EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                                AssetImages.camera))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                for (int i = 0; i < tab.length; i++) ...[
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<ProfileTabBloc>()
                                          .add(TabChange(tabIndex: i));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: state.tabIndex == i
                                              ? Colors.white
                                              : null,
                                          border: Border.all(
                                            color: state.tabIndex == i
                                                ? Colors.white
                                                : const Color(0xff51D2C3),
                                          ),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            tab[i]["icon"],
                                            color: state.tabIndex == i
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            tab[i]["name"],
                                            style: state.tabIndex == i
                                                ? style14w400b
                                                : style14w400w,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: myPageList[state.tabIndex],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    }

    return Container();
  }

  Container myage(String age) {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColor.greenlight,
          )),
      child: Text(
        age,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
