import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../../commonBloc/rankBloc/rank_bloc.dart';
import '../../../commonBloc/uploadpic/upload_pic_bloc.dart';
import '../../../commonfun/capitale.dart';
import '../../../config/sharedPrefs.dart';
import '../../../utils/color.dart';
import '../../../utils/constimage.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';
import '../../commonwidget/dropdown.dart';
import '../../commonwidget/register_textfields.dart';
import '../../commonwidget/textfield.dart';
import '../../otp/bloc/timer_bloc.dart';
import '../../otp/email_otp.dart';
import '../submit/submit_bloc.dart';

class MainUpdate extends StatefulWidget {
  const MainUpdate({super.key});

  @override
  State<MainUpdate> createState() => _MainUpdateState();
}

class _MainUpdateState extends State<MainUpdate> {
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

  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  final dropdownState3 = GlobalKey<FormFieldState>();

  alertDlog(String otp) {
    // set up the AlertDialog
    Dialog alert = Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      //backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
      child: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: EmailOtp(
            otp: otp,
            email: email.text,
          )),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String? blodgup;
  String? category;
  String? rankid;
  String? vemail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      var sub = BlocProvider.of<SubmitBloc>(context, listen: false).state;
      if (sub is Profileloaded) {
        vemail = sub.userDetails!.data!.details!.email.toString();
        context.read<RankBloc>().add(GetRank(sub.userDetails!.data!.details!.categoryId.toString()));

        // var state3 = BlocProvider.of<RankBloc>(context, listen: false).state;
       // var state3 = context.watch<RankBloc>().state;
       //  if(state3 is RankLoad){
          Future.delayed(const Duration(milliseconds: 1000), () {
            dropdownState3.currentState?.didChange(sub.userDetails!.data!.details!.rank);
          });
       // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var state1 = context.watch<SubmitBloc>().state;
    var state2 = context.watch<UploadPicBloc>().state;
    if (state1 is Profileloaded) {
      var data = state1.userDetails?.data?.details;
      name.text = data!.name.toString();
      email.text = data.email.toString();

      pan.text = data.pan.toString();
      city.text = data.city ?? "";
      state.text = data.state ?? "";
      indos.text = data.indosNumber.toString();
      phone.text = data.phone.toString();
      railway.text = data.nearestRailwayStation ?? "";
      airport.text = data.nearestAirport ?? "";
      passport.text = data.passportNumber ?? "";
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(data.dob.toString());
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(parseDate);
      dob.text = outputDate.toString();
      print(data.bloodGroup);
      Future.delayed(const Duration(milliseconds: 500), () {
        dropdownState.currentState?.didChange(data.bloodGroup);
      });
      blodgup = data.bloodGroup;
      ageCaculate(DateTime.now(), parseDate);
      Future.delayed(const Duration(milliseconds: 500), () {
        dropdownState2.currentState?.didChange(data.category);
      });
      rankid=data.rankId.toString();
    }

    Map data = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "dob": dob.text,
      "indos_number": indos.text,
      "blood_group": blodgup,
      "nearest_airport": airport.text,
      "pan": pan.text,
      "nearest_railway_station": railway.text,
      "city": city.text,
      "state": state.text,
      "passport_number": passport.text,
    };

    UserPrefs().setData("profilesetup", jsonEncode(data));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocListener<TimerBloc, TimerState>(
            listener: (context, state3) {
              if (state3 is Emailotpsent) {
                alertDlog(state3.emailOtp.data!.emailOtp.toString());
              }
              if (state3 is EmailVerify) {
                vemail = email.text;
                Navigator.pop(context);
              }
              // TODO: implement listener
            },
            child: Column(
              children: [
                RegisterTextfields(
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

                    dob.text = DateFormat('yyyy-MM-dd').format(pickedDate!);
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
                        list: state.res.data!.bloodGroups??[],
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
    print("index123  $ids");
    if(ids!=null) {
      context.read<RankBloc>().add(GetRank(id[ids]));
    }
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
                          if(ids!=null){
                          rankid=rid[ids];}
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
                  inputFormatters: <TextInputFormatter>[
                    UpperCaseTextFormatter()
                  ],
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
                  bordercolor: AppColor.greenlight,
                  textcolor: Colors.white,
                  fillcolor: Colors.white.withOpacity(.1),
                  mycon: city,
                  hint: "City",
                  isvalid: 3,
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
                  isvalid: 3,
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
                  isvalid: 3,
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
                  isvalid: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<UploadPicBloc, UploadPicState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        context
                            .read<UploadPicBloc>()
                            .add(SelectResume("resume"));

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
                              color: Colors.white.withOpacity(.1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(
                                          minWidth: 100, maxWidth: 250),
                                      child: Text(
                                        state.picdata["resume"]
                                                ?.split("/")
                                                .last ??
                                            "Upload Docx or PDF file",

                                        // maxLines: 1,99NL1171

                                        style: GoogleFonts.roboto(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.white.withOpacity(.7)),
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
                  print("$vemail ${email.text}");
                  if (vemail == email.text) {
                    if (state2 is SelectPicSuccess) {
                      UserPrefs()
                          .setData("allimage", jsonEncode(state2.picdata));
                    }
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
                    UserPrefs().setData("profilesetup", jsonEncode(data));
print(data);
                    context.read<SubmitBloc>().add(UpdateForm());
                  } else {
                    context.read<TimerBloc>().add(SendEmailotp(email.text));
                  }
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
