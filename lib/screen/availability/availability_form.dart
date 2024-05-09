import "dart:convert";
import "package:apeejay_crew_management/screen/commonwidget/test_drop.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "../../commonBloc/dropdownList/dropdown_bloc.dart";
import "../../config/sharedPrefs.dart";
import "../../utils/constimage.dart";
import "../../utils/style.dart";
import "../bank/bank_details.dart";
import "../commonwidget/app_button.dart";
import "../commonwidget/register_textfields.dart";

class Availability_Form extends StatefulWidget {
  Availability_Form({super.key});

  @override
  State<Availability_Form> createState() => _Availability_FormState();
}

class _Availability_FormState extends State<Availability_Form> {
  final TextEditingController month1 = TextEditingController();

  final TextEditingController month2 = TextEditingController();

  final dropdownState = GlobalKey<FormFieldState>();

  final dropdownState2 = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();
  String? fsize;
  String? month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.availabilitybg),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Availability Form",
                  style: style28w400b,
                ),
                const SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  "Fill up the form for your Availability",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff545454)),
                ),
                const SizedBox(
                  height: 25,
                ),
                AutoSizeText(
                  "Availability Month",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff545454)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RegisterTextfields(
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
                          color: const Color(0xff545454)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: RegisterTextfields(
                        bordercolor: const Color(0xffB5C6C4),
                        myfun: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
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
                  iswhite: true,
                  bordercolor: const Color(0xffB5C6C4),
                  textcolor: const Color(0xff545454),
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
                        iswhite: true,
                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: const Color(0xff545454),
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data!.sailingAreas??[],
                        mayfun: (String? val) {
                          fsize = val;
                          setState(() {});
                        },
                        hint: 'Preferred Sailing Area',
                        selectedValue: fsize,
                      );
                    }
                    return Container();
                  },
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            AppButton(
                              color: const Color(0xffB81521),
                              width: 105,
                              myfun: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BankDetails()));
                              },
                              mystyle: style18w600w,
                              name: "Skip",
                            ),
                            AppButton(
                              color: Colors.black,
                              width: 135,
                              myfun: () {
                                final isValid =
                                _formKey.currentState!.validate();
                                if (!isValid) {
                                  return;
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
                                UserPrefs()
                                    .setData("availabile", jsonEncode(data));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const BankDetails()));
                              },
                              mystyle: style18w600w,
                              name: "SUBMIT",
                            ),
                          ],
                        ))),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
