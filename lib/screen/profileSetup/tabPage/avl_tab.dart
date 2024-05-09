import "dart:convert";

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

import "../../../commonBloc/dropdownList/dropdown_bloc.dart";
import "../../../commonBloc/uploadpic/upload_pic_bloc.dart";
import "../../../config/sharedPrefs.dart";
import "../../../utils/color.dart";
import "../../../utils/constimage.dart";
import "../../../utils/style.dart";
import "../../commonwidget/app_button.dart";
import "../../commonwidget/register_textfields.dart";
import "../../commonwidget/test_drop.dart";
import "../submit/submit_bloc.dart";

class AvlTab extends StatefulWidget {
  AvlTab({super.key});

  @override
  State<AvlTab> createState() => _AvlTabState();
}

class _AvlTabState extends State<AvlTab> {
  final TextEditingController month1 = TextEditingController();

  final TextEditingController month2 = TextEditingController();

  final dropdownState = GlobalKey<FormFieldState>();

  final dropdownState2 = GlobalKey<FormFieldState>();
  String? month;
  String? fsize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var state1 = BlocProvider.of<SubmitBloc>(context, listen: false).state;
    if (state1 is Profileloaded) {
      var data = state1.userDetails?.data?.details;

      if (data!.availableFrom != null) {
        DateTime parseDate =
            DateFormat("yyyy-MM-dd").parse(data.availableFrom.toString());
        var outputFormat = DateFormat('dd/MM/yyyy').format(parseDate);
        month2.text = outputFormat;
      }
      if (data.availableTo != null){
        DateTime parseDate =
            DateFormat("yyyy-MM-dd").parse(data.availableTo.toString());
        var outputFormat = DateFormat('dd/MM/yyyy').format(parseDate);
        month1.text = outputFormat;
      }
      if (data.preferredSailingArea != null) {
        fsize = data.preferredSailingArea ?? "";
      }
      if (data.preferredContract != null) {
        month = data.preferredContract ?? "";
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var state2 = context.watch<UploadPicBloc>().state;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Availability Month",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RegisterTextfields(
                        textcolor: Colors.white,
                        fillcolor: Colors.white.withOpacity(.1),
                        bordercolor: const Color(0xffB5C6C4),
                        myfun: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                          );

                          month1.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate!);
                        },
                        readonly: true,
                        isicon: true,
                        icon: AssetImages.dob,
                        mycon: month1,
                        hint: "Month",
                        isvalid: 3,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      "to",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: RegisterTextfields(
                        textcolor: Colors.white,
                        fillcolor: Colors.white.withOpacity(.1),
                        bordercolor: const Color(0xffB5C6C4),
                        myfun: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:  DateTime(2050),
                          );

                          month2.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate!);
                        },
                        readonly: true,
                        isicon: true,
                        icon: AssetImages.dob,
                        mycon: month2,
                        hint: "Month",
                        isvalid: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TestDrop(
                  bordercolor: const Color(0xffB5C6C4),
                  textcolor: Colors.white,
                  fillcolor: Colors.white.withOpacity(.1),
                  list: const [
                    "1 Months",
                    "2 Months",
                    "3 Months",
                    "4 Months",
                    "5 Months"
                  ],
                  mayfun: (String? val) {
                    month = val;
                    setState(() {});
                  },
                  hint: 'Preferred Period of Contract',
                  selectedValue: month,
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<DropdownBloc, DropdownState>(
                  builder: (context, state) {
                    if (state is DropdownSuccess) {
                      return TestDrop(
                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: Colors.white,
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data!.sailingAreas??[],
                        mayfun: (String? val) {
                          fsize = val;
                          setState(() {});
                        },
                        hint: 'Preferred Sailing Area',
                        selectedValue: fsize,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
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
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) {
                    return;
                  }
                  if (state2 is SelectPicSuccess) {
                    UserPrefs().setData("allimage", jsonEncode(state2.picdata));
                  }
                  Map data = {
                    "available_from": month1.text,
                    "available_to": month2.text,
                    "preferred_contract": month,
                    "preferred_sailing_area": fsize
                  };
                  data.removeWhere((key, value) {
                    return value == null || value == "";
                  });
                  UserPrefs().setData("availabile", jsonEncode(data));
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
