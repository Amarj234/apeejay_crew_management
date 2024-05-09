import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../model/announcements_model.dart';
import '../../../utils/style.dart';
import '../../commonwidget/app_button.dart';
import '../announcement_details.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({super.key, required this.announcements});
  final Announcements announcements;

  String difrent(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }

  String time(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var outputFormat = DateFormat('hh:mm a');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AssetImages.card,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          AutoSizeText(
            maxLines: 2,
            announcements.title.toString(),
            style: style16w500b,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(announcements.description.toString(),
              maxLines: 3,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xff545454),
              )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetImages.dob,
                    color: const Color(0xff909090),
                    width: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(difrent(announcements.broadcastDate.toString()),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff434343),
                      )),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(time(announcements.broadcastDate.toString()),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff434343),
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          AppButton(
            hight: 42,
            horizontal: 20,
            color: Colors.black,
            width: 120,
            myfun: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  AnnouncementDetails(announcements: announcements,)));
            },
            mystyle: style14w500w,
            name: "View Details",
          ),
        ],
      ),
    );
  }
}
