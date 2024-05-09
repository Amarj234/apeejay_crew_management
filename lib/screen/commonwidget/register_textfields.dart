import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../commonfun/validations.dart';
import '../../utils/color.dart';

class RegisterTextfields extends StatelessWidget {
  const RegisterTextfields(
      {Key? key,
      required this.hint,
      required this.isvalid,
      required this.mycon,
      this.inputFormatters,
      this.icon,
      this.isicon = false,
      this.readonly = false,
      this.myfun,  this.textcolor=AppColor.main, this.fillcolor, required this.bordercolor})
      : super(key: key);
  final String hint;
  final int isvalid;
  final bool isicon;
  final Color textcolor;
  final Color bordercolor;
  final Color? fillcolor;
  final bool readonly;
  final String? icon;
  final Function()? myfun;
  final TextEditingController mycon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: myfun,
      readOnly: readonly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: mycon,
      style: GoogleFonts.roboto(
        color: textcolor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: isvalid == 1
          ? TextInputType.emailAddress
          : isvalid == 2
              ? TextInputType.number
              : TextInputType.text,
      inputFormatters: inputFormatters,
      validator: isvalid == 0
          ? (v) {
              return null;
            }
          : isvalid == 1
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  } else if (Validations().isValidEmail(value) == false) {
                    return 'Please enter valid Email';
                  }
                  return null;
                }
              : isvalid == 2
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone';
                      } else if (Validations().validatePhone(value) == false) {
                        return 'Please enter valid Phone';
                      }
                      return null;
                    }
                  : (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $hint';
                      }
                      return null;
                    },
      decoration: InputDecoration(
        fillColor: fillcolor,
        filled:fillcolor==null ? false: true,
        suffixIcon: isicon? InkWell(onTap:myfun,child: Image.asset(icon!,color: textcolor,)):Container(width: 1,),
          contentPadding: const EdgeInsets.only(top: 1, bottom: 1, left: 10),
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
          hintStyle: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textcolor),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordercolor),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
