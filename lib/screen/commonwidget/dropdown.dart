import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../utils/constimage.dart';
import '../../utils/color.dart';

class DropDown extends StatelessWidget {
  const DropDown(
      {Key? key,
      required this.list,
      required this.hint,
      required this.mayfun,
      required this.dropdownState,  this.textcolor=AppColor.main, this.fillcolor, required this.bordercolor,  this.iswhite=false})
      : super(key: key);
  final List<String> list;
  final String hint;
  final Color textcolor;
  final Color bordercolor;
  final Color? fillcolor;
  final bool iswhite;
  final Function(String? val) mayfun;
  final GlobalKey dropdownState;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(

dropdownColor:iswhite ?Colors.white:bordercolor,
      key: dropdownState,
      icon: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Image.asset(AssetImages.arrowdown,color: textcolor,),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
      style: GoogleFonts.roboto(
        color: textcolor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration:  InputDecoration(
        fillColor: fillcolor,
        filled:fillcolor==null ? false: true,
        contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: bordercolor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: bordercolor,
          ),
        ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordercolor),
              borderRadius: BorderRadius.circular(5)),
        hintStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textcolor),
      ),

      hint: Text(hint,style: TextStyle(color: textcolor),),
      items: list
          .map((label) => DropdownMenuItem(

                value: label,
                child: Text(label.toString(),style: TextStyle(color: textcolor, overflow: TextOverflow.visible,),),
              ))
          .toList(),

      onChanged:mayfun, //what you need for height
    );
  }
}
