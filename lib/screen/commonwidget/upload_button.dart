
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
class UploadButton extends StatelessWidget {
  const UploadButton({super.key, required this.txt, required this.myfun,  this.iswcolor=false});
final String txt;
final bool iswcolor;
final Function() myfun;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: myfun,
      child: DottedBorder(
        strokeWidth: 1,
        color: AppColor.greenlight,
        dashPattern: const [7,8],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),

        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white.withOpacity(.1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints:
                  const BoxConstraints(
                      minWidth: 100,
                      maxWidth: 250),
                  child: Text(
                    txt,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: iswcolor?Colors.white: const Color(0xff595959)),
                  ),
                ),
                SvgPicture.asset(color:iswcolor?Colors.white: const Color(0xff595959),AssetImages.upload ,)
              ],),
          ),),
      ),
    );
  }
}
