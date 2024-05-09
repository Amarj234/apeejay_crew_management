import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';

class JobsAvl extends StatelessWidget {
  const JobsAvl({super.key, required this.sno, required this.date, required this.title, required this.subtitle, required this.location, required this.jobtime, required this.quick, required this.detaild});
final String sno;
final String date;
final String title;
final String subtitle;
final String location;
final String jobtime;
final Function() quick;
final Function() detaild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:20),
      padding: const EdgeInsets.only(left: 15,right: 15, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(.05),width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              offset: const Offset(-1, 0),
              blurRadius: 4,
              spreadRadius: 1,
            )

          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE9E9E9)),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: AutoSizeText(
                  sno,
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7000B)),
                ),
              ),
              RichText(
                  // overflow:
                  //     // TextOverflow
                  //     //     .ellipsis,
                  text: TextSpan(
                      text: "Application Deadline: ",
                      style: GoogleFonts.roboto(
                        color: const Color(0xffA9A9A9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                    TextSpan(
                        spellOut: true,
                        text: date,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color(0xff545454),
                        ))
                  ])),
            ],
          ),
          const SizedBox(height: 15,),
          AutoSizeText(
            title,
            style: style16w500b,
          ),
          Text(
              subtitle,
              maxLines: 3,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xff545454),
              )),
          const SizedBox(height: 15,),
          RichText(
            // overflow:
            //     // TextOverflow
            //     //     .ellipsis,
              text: TextSpan(
                  text: "Location: ",
                  style: GoogleFonts.roboto(
                    color: const Color(0xffA9A9A9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                        spellOut: true,
                        text: location,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color(0xff2E8B80),
                        ))
                  ])),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffE9F4FF),

          ),
            child: Text(jobtime,style: style16w500b,),
          ),

          const SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppButton(
                hight: 42,
                horizontal: 20,
                color: const Color(0xff2E8B80),
                width: 118,
                myfun: quick,
                mystyle:  style14w500w,
                name: "Quick Apply",
              ),
              const SizedBox(width: 10,),
              AppButton(
                hight: 42,
                horizontal: 20,
                color: Colors.black,
                width: 120,
                myfun: detaild,
                mystyle: style14w500w,
                name: "View Details",
              ),
            ],
          ),
          const SizedBox(height: 15,)

        ],
      ),
    );
  }
}
