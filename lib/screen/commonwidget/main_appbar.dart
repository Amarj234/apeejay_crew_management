import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../utils/color.dart';


import '../../utils/constimage.dart';
import '../notification/bloc/notification_bloc.dart';
import '../notification/notification_Screen.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({Key? key,
    this.title,
    this.actions,
    required this.context,
    this.leading = false,
    this.ontap,  this.back=false})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String? title;
  final bool? actions;
  final bool leading;
  final bool back;
  final BuildContext context;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leadingWidth: leading ? 50 : 120,
      backgroundColor: leading ? const Color(0xffB81521) : Colors.white,
      leading: leading
          ? back? InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AssetImages.arrowback)):Container()
          : Image.asset(
        AssetImages.appbar,
        height: 120,
      ),
      // automaticallyImplyLeading: automaticallyImplyLeading ?? true,

      actions: [
        // Image.asset(AssetImages.appbaricon),
        InkWell(
          overlayColor: MaterialStateProperty.all(AppColor.main),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
          },
          child: leading ? Container() : Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: badges.Badge(
              badgeStyle: const BadgeStyle(
                badgeColor: Color(0xffB7000B),
              ),
              badgeContent: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  return (state is NotificationCountread)? Text(state.countNotification.data?.notificationCount.toString()??"", style: const TextStyle(color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)):const Text('0', style: TextStyle(color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700));
                },
              ),
              child: Image.asset(
                AssetImages.bell,
                width: 23,
                height: 23,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(AppColor.main),
          onTap: ontap,
          child: Image.asset(
            AssetImages.menu,
            width: 23,
            height: 23,
            color: leading ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
      title: Text(
        title ?? "",
        style: GoogleFonts.roboto(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      toolbarHeight: 120,
      elevation: 0,
      // flexibleSpace: leading == false
      //     ? Padding(
      //         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 1.6, top: 30),
      //         child: SvgPicture.asset(AssetImages.appbarsvg),
      //       )
      //     : Container(),
    );
  }
}
