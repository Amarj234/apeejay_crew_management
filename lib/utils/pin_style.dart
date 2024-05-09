
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'color.dart';

final defaultPinTheme = PinTheme(
  textStyle: GoogleFonts.roboto(color: Colors.blue),
  height: 70,
  width: 80,
  decoration: BoxDecoration(
      border: Border.all(color: AppColor.redapp),
      color:  const Color(0xfff6dddf),
      borderRadius: BorderRadius.circular(10)),
);
final followingPinTheme = PinTheme(
  textStyle: GoogleFonts.roboto(color: Colors.white),
  height: 70,
  width: 80,
  decoration: BoxDecoration(
      border: Border.all(color: AppColor.redapp),
      color:  const Color(0xffefc3c5),
      borderRadius: BorderRadius.circular(10)),
);
final activePinTheme = PinTheme(
  textStyle: GoogleFonts.roboto(color: Colors.red),
  height: 70,
  width: 80,
  decoration: BoxDecoration(
      border: Border.all(color: AppColor.redapp, width: 2),
      color: const Color(0xffefc3c5),
      borderRadius: BorderRadius.circular(10)),
);
final submittedPinTheme = PinTheme(
  textStyle: GoogleFonts.roboto(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
  height: 70,
  width: 80,
  decoration: BoxDecoration(
    color: AppColor.redapp, //AppColor.main.withOpacity(0.25),
    borderRadius: BorderRadius.circular(10),
  ),
);
