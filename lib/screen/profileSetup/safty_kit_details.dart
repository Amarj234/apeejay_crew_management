import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../availability/availability_form.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/costum_snackbar.dart';
import '../commonwidget/test_drop.dart';

class SaftyKitDetails extends StatefulWidget {
  const SaftyKitDetails({super.key});

  @override
  State<SaftyKitDetails> createState() => _SaftyKitDetailsState();
}

class _SaftyKitDetailsState extends State<SaftyKitDetails> {
  String? bsize;
  String? shoesize;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.formreg),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
        child: SafeArea(
          child: BlocConsumer<DropdownBloc, DropdownState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is DropdownSuccess) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Safety Kit Details",
                        style: style28w400b,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        "Fill up the form for your safety kits",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff545454)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AutoSizeText(
                        "Body Measurement for Uniform",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff545454)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TestDrop(
                        iswhite: true,
                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: const Color(0xff545454),
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data?.uniformSizes??[],
                        mayfun: (String? val) {
                          bsize = val;
                          setState(() {});
                        },
                        hint: 'Boiler Suit Size',
                        selectedValue: bsize,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AutoSizeText(
                        "Foot Size for Shoes",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff545454)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TestDrop(
                        iswhite: true,
                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: const Color(0xff545454),
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data!.shoeSizes??[],
                        mayfun: (String? val) {
                          shoesize = val;
                          setState(() {});
                        },
                        hint: 'Safety Shoe size',
                        selectedValue: shoesize,
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  AppButton(
                                    color: const Color(0xffB81521),
                                    width: 105,
                                    myfun: () {
                                      print(
                                          UserPrefs().getData("profilesetup"));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Availability_Form()));
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
                                        "uniform_size": bsize,
                                        "foot_size": shoesize
                                      };
                                      data.removeWhere((key, value) {
                                        return value == null || value == "";
                                      });
                                      if (bsize == null) {
                                        CostomSnackbar.show(context,
                                            "Please Select Body Measurement for Uniform");
                                      } else if (shoesize == null) {
                                        CostomSnackbar.show(context,
                                            "Please Select Safety Shoe size");
                                      } else {
                                        UserPrefs().setData(
                                            "saftykit", jsonEncode(data));

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Availability_Form()));
                                      }
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
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
