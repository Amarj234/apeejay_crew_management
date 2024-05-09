import 'dart:convert';
import 'dart:io';
import 'package:age_calculator/age_calculator.dart';
import 'package:apeejay_crew_management/screen/profileSetup/safty_kit_details.dart';
import 'package:apeejay_crew_management/utils/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../commonBloc/rankBloc/rank_bloc.dart';
import '../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../commonfun/capitale.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/dropdown.dart';
import '../commonwidget/register_textfields.dart';
import '../commonwidget/select_image.dart';
import '../commonwidget/textfield.dart';



class ProfileForm extends StatefulWidget {
  const ProfileForm(
      {super.key,
      required this.email,
      required this.phone,
      required this.name,
      required this.dob,
      required this.indos, required this.passport});
  final String email;
  final String phone;
  final String name;
  final String passport;
  final DateTime dob;
  final String indos;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pan = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController airport = TextEditingController();
  TextEditingController railway = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController indos = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController emailotp = TextEditingController();
  String? profile;
  String? resume;

  String flag = "🇮🇳";
  String country = "+91";
  String date = "0";
  String years = "0";
  String month = "0";
  bool ageerror = false;

  void ageCaculate(DateTime today, DateTime dob) {
    final duration = AgeCalculator.dateDifference(
      fromDate: dob,
      toDate: today,
    );
    date = duration.days.toString();
    years = duration.years.toString();
    month = duration.months.abs().toString();
    setState(() {
      if (duration.years < 18) {
        ageerror = true;
      } else {
        ageerror = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text = widget.email;
    phone.text = widget.phone;
    name.text = widget.name;
    indos.text = widget.indos;
    passport.text = widget.passport;
    dob.text = DateFormat('dd/MM/yyyy').format(widget.dob);
    ageCaculate(DateTime.now(), widget.dob);
  }

  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  final dropdownState3 = GlobalKey<FormFieldState>();
  String? blodgup;
  String? category;
  String? rankid;
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     var state2 = context.watch<UploadPicBloc>().state;
    return Scaffold(
      // backgroundColor: AppColor.green,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              height: 1320,
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
                top: 80.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Profile Setup Form",
                            style: style28w400b,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              BlocConsumer<UploadPicBloc, UploadPicState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  if (state is SelectPicSuccess) {
                                    profile = state.picdata["profile_photo"];
                                    return Container(
                                      height: 122,
                                      width: 111,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: state.picdata[
                                                      'profile_photo'] ==
                                                  null
                                              ? DecorationImage(
                                                  image: AssetImage(
                                                      AssetImages.profilep),
                                                  fit: BoxFit.cover)
                                              : DecorationImage(
                                                  image: FileImage(File(
                                                      state.picdata[
                                                          'profile_photo'])),
                                                  fit: BoxFit.cover)),
                                    );
                                  } else {
                                    return Container(
                                        height: 122,
                                        width: 111,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    AssetImages.profilep),
                                                fit: BoxFit.cover)));
                                  }
                                },
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100.0, top: 80),
                                  child: InkWell(
                                      onTap: () {
                                        showImagePickerOptions("profile_photo");
                                        //alertDlog();
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: const EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                              AssetImages.camera))),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RegisterTextfields(
                            readonly: true,
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: name,
                            hint: "Name",
                            isvalid: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            myfun: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              dob.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate!);
                              ageCaculate(DateTime.now(), pickedDate);
                            },
                            readonly: true,
                            isicon: true,
                            icon: AssetImages.dob,
                            mycon: dob,
                            hint: "DOB",
                            isvalid: 3,
                          ),
                          Container(
                              child: ageerror
                                  ? const Text(
                                      "Please choose a Valid age",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Container()),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              myage("$years years"),
                              myage("$month months"),
                              myage("$date Day"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<DropdownBloc, DropdownState>(
                            builder: (context, state) {
                              if (state is DropdownSuccess) {
                                return DropDown(
                                  bordercolor: AppColor.greenlight,
                                  textcolor: Colors.white,
                                  fillcolor: Colors.white.withOpacity(.1),
                                  list: state.res.data?.bloodGroups??[],
                                  mayfun: (String? val) {
                                    blodgup = val;
                                  },
                                  hint: 'Blood Group',
                                  dropdownState: dropdownState,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<DropdownBloc, DropdownState>(
                            builder: (context, state) {
                              if (state is DropdownSuccess) {
                                List<String>cot=[];
                                List<String>id=[];
                                state.res.data!.rankCategories!.forEach((element){
                                  cot.add(element.category!);
                                  id.add(element.id.toString());
                                });

                                return DropDown(
                                  bordercolor: AppColor.greenlight,
                                  textcolor: Colors.white,
                                  fillcolor: Colors.white.withOpacity(.1),
                                  list: cot,
                                  mayfun: (String? val) {
                                    category = val;
                                    int ids=cot.indexWhere((element) => element==val);

                                    context.read<RankBloc>().add(GetRank(id[ids]));
                                    dropdownState3.currentState?.reset();
                                  },
                                  hint: 'Cotagory',
                                  dropdownState: dropdownState2,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<RankBloc, RankState>(
                            builder: (context, state) {
                              // if (state is RankLoad) {
                              List<String>rank=[];
                              List<String>rid=[];
                              state.rankList.forEach((element){
                                rank.add(element.rank!);
                                rid.add(element.id.toString());
                              });

                              return DropDown(
                                bordercolor: AppColor.greenlight,
                                textcolor: Colors.white,
                                fillcolor: Colors.white.withOpacity(.1),
                                list: rank,
                                mayfun: (String? val) {
                                  int ids=rank.indexWhere((element) => element==val);
                                  rankid=rid[ids];
                                  // context.read<RankBloc>().add(GetRank(rid[ids]));
                                },
                                hint: 'Rank',
                                dropdownState: dropdownState3,
                              );
                              // } else {
                              //   return Container();
                              // }
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            inputFormatters: <TextInputFormatter>[
                              UpperCaseTextFormatter()
                            ],
                            readonly: true,
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: indos,
                            hint: "INDos Number",
                            isvalid: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            hint: 'Mobile Number',
                            mycon: phone, cuntryFun: (String? val) {  },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            readonly: true,
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: email,
                            hint: "Email Address",
                            isvalid: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            inputFormatters: <TextInputFormatter>[
                              UpperCaseTextFormatter()
                            ],
                            readonly: true,
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: passport,
                            hint: "Passport",
                            isvalid: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            inputFormatters: <TextInputFormatter>[
                              UpperCaseTextFormatter()
                            ],
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: pan,
                            hint: "PAN",
                            isvalid: 3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: city,
                            hint: "City",
                            isvalid: 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: state,
                            hint: "State",
                            isvalid: 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: airport,
                            hint: "Nearest Airport",
                            isvalid: 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RegisterTextfields(
                            bordercolor: AppColor.greenlight,
                            textcolor: Colors.white,
                            fillcolor: Colors.white.withOpacity(.1),
                            mycon: railway,
                            hint: "Nearest Railway Stn",
                            isvalid: 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<UploadPicBloc, UploadPicState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () async {
                                  context.read<UploadPicBloc>().add(SelectResume("resume"));

                                  // showImagePickerOptions("resume");
                                },
                                child: DottedBorder(
                                  strokeWidth: 2,
                                  color: AppColor.greenlight,
                                  dashPattern: const [3, 8],
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(6)
                                    
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                constraints:
                                                    const BoxConstraints(
                                                        minWidth: 100,
                                                        maxWidth: 250),
                                                child: Text(
                                                  state.picdata["resume"]
                                                          ?.split("/")
                                                          .last ??
                                                      "Upload Docx or PDF file",

                                                  // maxLines: 1,99NL1171

                                                  style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white
                                                          .withOpacity(.7)),
                                                ),
                                              ),
                                              AutoSizeText(
                                                "Upload Resume",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(AssetImages.upload)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                                BlendMode.modulate,
                              ),
                              image: AssetImage(AssetImages.profilebot))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            width: 135,
                            myfun: () {
                              print(state2.picdata);
                              final isValid = _formKey.currentState!.validate();
                              if (!isValid) {
                                return;
                              }

                                  if (state2 is SelectPicSuccess) {


                              Map data = {
                                "name": name.text,
                                "email": email.text,
                                "phone": phone.text,
                                "dob": dob.text,
                                "indos_number": indos.text,
                                "blood_group": blodgup,
                                "nearest_airport": airport.text,
                                "pan": pan.text,
                                "rank_id": rankid,
                                "nearest_railway_station": railway.text,
                                "city": city.text,
                                "state": state.text,
                                "passport_number": passport.text,
                              };
                              data.removeWhere((key, value) {
                                return value == null || value == "";
                              });
                              if (state2.picdata['resume'] == null) {

                                EasyLoading.showInfo('Please Upload Resume');


                              } else if (state2.picdata['profile_photo'] == null) {
                                EasyLoading.showInfo('Please Upload Profile');

                              } else if (rankid == null) {
                                EasyLoading.showInfo('Please Select ');

                              }
                              else {
                                UserPrefs()
                                    .setData("profilesetup", jsonEncode(data));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SaftyKitDetails()));
                              } }else{
                                    EasyLoading.showInfo('Please Upload Profile and Resume');
                                  }
                            },
                            mystyle: style18w600b,
                            name: "SUBMIT",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Container myage(String age) {
    return Container(
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
