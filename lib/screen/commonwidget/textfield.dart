import 'package:apeejay_crew_management/utils/color.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../commonfun/validations.dart';
import '../../utils/constimage.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    Key? key,
    required this.hint,
    required this.mycon,
    this.isEmail = false,
    this.inputFormatters,  this.textcolor=AppColor.main, this.fillcolor, required this.bordercolor,  this.isred=false, required this.cuntryFun,
  }) : super(key: key);
  final String hint;
  final bool isEmail;
  final bool isred;
  final Color textcolor;
  final Function(String? val) cuntryFun;
  final Color bordercolor;
  final Color? fillcolor;
  final TextEditingController mycon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  String flag = "🇮🇳";

  String country1 = "+91";

  countryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        flag = country.flagEmoji;
        country1 = "+${country.phoneCode}";
        widget.cuntryFun(country1);
        setState(() {

        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      keyboardType:TextInputType.phone ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.mycon,
      inputFormatters: widget.inputFormatters,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter phone';
        } else if (Validations().validatePhone(value) == false) {
          return 'Please enter valid Phone';
        }
        return null;
      },
      style: GoogleFonts.roboto(
        color: widget.textcolor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          counterText: "",
          fillColor: widget.fillcolor,
          filled:widget.fillcolor==null ? false: true,
          prefixIcon: SizedBox(
            width: 90,
            child: InkWell(
              onTap: () {
                countryPicker(context);
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    decoration: BoxDecoration(
                      color: widget.isred?const Color(0xff771218):null,
                        border: Border.all(color:widget.isred?const Color(0xffB7000B):const Color(0xffB5C6C4)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text("${widget.isred? "":flag} $country1",style: TextStyle(color:widget.isred?Colors.white: widget.textcolor),),
                        Image.asset(AssetImages.arrowdown,color: widget.isred?Colors.white:widget.textcolor,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 1, bottom: 1, left: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: widget.bordercolor,
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
              color: widget.bordercolor,
            ),
          ),
          helperStyle: GoogleFonts.leagueSpartan(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xff595959)),
          hintStyle:  GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:widget.isred? Colors.white: widget.textcolor
          ),
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.bordercolor),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
