import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../commonBloc/dropdownList/dropdown_bloc.dart';
import '../../../config/sharedPrefs.dart';
import '../../../utils/color.dart';
import '../../../utils/constimage.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';
import '../../commonwidget/test_drop.dart';
import '../submit/submit_bloc.dart';

class SaftyTab extends StatefulWidget {
  const SaftyTab({super.key});

  @override
  State<SaftyTab> createState() => _SaftyTabState();
}

class _SaftyTabState extends State<SaftyTab> {
  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  String? bsize;
  String? shoesize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var state1=BlocProvider.of<SubmitBloc>(context,listen: false).state;
    if (state1 is Profileloaded) {
      var data = state1.userDetails?.data?.details;
      if(data!.uniformSize !=null) {
        bsize = data.uniformSize;
      }
      if(data.footSize !=null){
        shoesize = data.footSize;
      }

    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
     // padding: const EdgeInsets.only(left: 20, right: 20),
      child: SafeArea(
        child: BlocBuilder<DropdownBloc, DropdownState>(
          builder: (context, state) {
            if (state is DropdownSuccess) {
              return Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Body Measurement for Uniform",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TestDrop(

                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: Colors.white,
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data!.uniformSizes??[],
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
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TestDrop(

                        bordercolor: const Color(0xffB5C6C4),
                        textcolor: Colors.white,
                        fillcolor: Colors.white.withOpacity(.1),
                        list: state.res.data?.shoeSizes??[],
                        mayfun: (String? val) {
                          shoesize = val;
                          setState(() {});
                        },
                        hint: 'Safety Shoe size',
                        selectedValue: shoesize,
                      ),
                      const SizedBox(
                        height: 105,
                      ),

                    ],
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
                            Map data = {"uniform_size": bsize, "foot_size": shoesize};
                            data.removeWhere((key, value) {
                              return value == null || value == "";
                            });
                            UserPrefs().setData("saftykit", jsonEncode(data));



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
            return Container();
          },
        ),
      ),
    );
  }
}
