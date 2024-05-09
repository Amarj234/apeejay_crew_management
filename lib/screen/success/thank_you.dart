import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.availabilitybg),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 20,right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetImages.right1),

                    const SizedBox(
                      height: 15,
                    ),

                    AutoSizeText(
                      "Thank you ",
                      style: style28w400b,
                    ),
                    AutoSizeText(
                      "for applying with us.",
                      style: style28w400b,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      " We will get back to you. Wishing you luck",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff545454)),
                    ),

                    AutoSizeText(
                      "for the recruitment process.",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff545454)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),



                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          width: 223,
                          color: Colors.black,
                          myfun: () {
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const HomeScreen()));
                          },
                          mystyle: style18w500w,
                          name: "RETURN TO HOME",
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
