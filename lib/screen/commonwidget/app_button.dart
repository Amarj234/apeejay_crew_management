import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.mystyle,
      required this.name,
      this.width = 105,
      this.color = Colors.white,
      this.myfun,  this.horizontal=35,  this.hight=49});

  final TextStyle mystyle;
  final Color color;
  final String name;
  final double width;
  final double hight;
  final double horizontal;
  final Function()? myfun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: myfun,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: width,
              height: hight,
              margin: const EdgeInsets.only(
                top: 6,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 23),
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(

                margin: const EdgeInsets.only(bottom: 20, left: 9),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
                child: Text(
                  name,
                  style: mystyle,
                ))
          ],
        ));
  }
}
