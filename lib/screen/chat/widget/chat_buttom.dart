import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/constimage.dart';

class ChatButtom extends StatelessWidget {
  const ChatButtom({super.key, required this.controller, required this.myfun, required this.emojifun, required this.focusNode});
  final TextEditingController controller;
  final Function() myfun;
  final Function() emojifun;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xffB5C6C4)),
                color: Colors.white,
              ),
              child: IconButton(onPressed: emojifun, icon: Image.asset(AssetImages.emoji))),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xffB5C6C4)),
                color: Colors.white,
              ),
              child: TextFormField(
                focusNode: focusNode,
                controller: controller,
                maxLines: 1,
                decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 18.0,top: 5),
                      child: Text("|",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),),
                    ),
                    // suffixIcon: Image.asset(
                    //   AssetImages.fileselect,
                    //   width: 20,
                    //   height: 20,
                    // ),
                    contentPadding: EdgeInsets.only(left: 0, top: 10),
                    hintText: "Type a message",
                    hintStyle:
                    TextStyle(fontSize: 14, color: AppColor.main),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xffB5C6C4)),
                color: Colors.white,
              ),
              child: IconButton(onPressed: myfun, icon: Image.asset(AssetImages.send))),
        ],
      ),
    );
  }
}
