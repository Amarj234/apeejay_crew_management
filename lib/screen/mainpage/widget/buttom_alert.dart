import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../model/availableJob.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';

class ButtomAlert extends StatelessWidget {
  const ButtomAlert({super.key, required this.jobs, required this.myfun});
final Jobs jobs;
final Function() myfun;
  String difrent(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
    var outputFormat = DateFormat('dd-MMM-yy');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }

  String difrent2(String date) {
    DateTime parseDate = DateFormat("dd/MM/yyyy").parse(date);
    var outputFormat = DateFormat('dd-MMM-yy');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }
  Widget build(BuildContext context) {
    return Container(
padding: const EdgeInsets.only(right: 20,left: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


          children: <Widget>[
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: const Text("x",style: TextStyle(fontSize: 25),)),
                SizedBox(width: MediaQuery.of(context).size.width/3.1,),
                Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
                ),)
              ],
            ),
            const SizedBox(height: 20,),
            RichText(
              // overflow:
              //     // TextOverflow
              //     //     .ellipsis,
                text: TextSpan(
                    text: "Posted Date: ",
                    style: GoogleFonts.roboto(
                      color: const Color(0xffA9A9A9),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                          spellOut: true,
                          text: difrent(jobs.createdAt.toString()),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xff545454),
                          ))
                    ])),

            const SizedBox(height: 15,),
            AutoSizeText(
              jobs.title??"",
              style: style16w500b,
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Image.asset(AssetImages.location),
                const SizedBox(width: 6,),
                Text(
                  jobs.serviceType??"",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xff2E8B80),
                    )),
                const SizedBox(width: 26,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffE9F4FF),

                  ),
                  child: Text(jobs.jobType??"",style: style16w500b,),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.height-40,
              height: 1,
              color: const Color(0xffE9E9E9),
            ),
            const SizedBox(height: 15,),

            Text("Job Description",style: style16w500b,),
            const SizedBox(height: 7,),
            Text(
               jobs.description??"",  style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff545454),
                )),
            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 1,
              color: const Color(0xffE9E9E9),
            ),
            const SizedBox(height: 15,),

            Text("Job Eligibility",style: style16w500b,),
            const SizedBox(height: 7,),
            for(int i=0;i<jobs.eligibility!.split("\r\n-").length;i++)...[
              dotText(jobs.eligibility!.split("\r\n-")[i],context),
            ],




            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.height-40,
              height: 1,
              color: const Color(0xffE9E9E9),
            ),
            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffB81521).withOpacity(.2),

              ),
              child: Text("Application Deadline: ${difrent2(jobs.lastApplyDate.toString())}",style: style14w400b,),
            ),
            const SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  hight: 43,
                  horizontal: 25,
                  color: Colors.black,
                  width: 129,
                  myfun:myfun ,

                  //     (){
                  //   // var data=BlocProvider.of(context,listen: false).state;
                  //   var data=context.read<AvailableBloc>().state;
                  //   if(data is AvailableLoded) {
                  //     context.read<AvailableBloc>().add(
                  //         QuickApply(jobs.id!,context,data.availableJob));
                  //     Navigator.pop(context);
                  //   }
                  //
                  // },
                  mystyle:  style14w500w,
                  name: "APPLY NOW",
                ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Container dotText(String txt,BuildContext context){
    return   Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(children: [
       Image.asset(AssetImages.point,),
        const SizedBox(width: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width-70,
          child: Text(
              overflow:TextOverflow.ellipsis,
              txt,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xff545454),
              )),
        ),
      ],),
    );
  }
}
