import 'package:apeejay_crew_management/utils/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style.dart';

class JobsApp extends StatelessWidget {
  const JobsApp({super.key, required this.sno, required this.date, required this.title, required this.subtitle, required this.location, required this.jobtime, required this.status, required this.myfun, });
  final String sno;
  final String date;
  final String title;
  final String subtitle;
  final String location;
  final String jobtime;
  final Function() myfun;
  final num status;

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
              offset: Offset(-1, 0),
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE9E9E9)),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: AutoSizeText(
                  sno,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7000B)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffB81521).withOpacity(.2),

                ),
                child: Text("Applied Date: $date",style: style14w400b,),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          AutoSizeText(
            title,
            style: style16w500b,
          ),
          const SizedBox(height: 5,),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffE9F4FF),

                ),
                child: Text(jobtime,style: style16w500b,),
              ),

              InkWell(onTap: myfun,
                child: Text("View Details",

                  style: GoogleFonts.roboto(
                      decoration: TextDecoration.underline,
                    fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),),
              ),
            ],
          ),

          const SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.height-40,
            height: 1,
            color: const Color(0xffE9E9E9),
          ),
          const SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status of Application:",

                style: GoogleFonts.roboto(

                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),

             status==0? Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff5D5D5D).withOpacity(.1),

                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time,size: 17,),
                    const SizedBox(width: 5,),
                    Text("Pending",style: style16w500b,),
                  ],
                ),
              ):  status==1?Container(
               padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: AppColor.green,

               ),
               child: Row(
                 children: [
                   const Icon(Icons.check,size: 17,color: Colors.white,),
                   const SizedBox(width: 5,),
                   Text("Approved",style: style16w500w,),
                 ],
               ),
             ):Container(
               padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: AppColor.radiocolr,

               ),
               child: Row(
                 children: [
                   const Icon(Icons.clear_rounded,size: 17,color: Colors.white,),
                   const SizedBox(width: 5,),
                   Text("Rejected",style: style16w500w,),
                 ],
               ),
             ),
            ],
          ),
          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}
