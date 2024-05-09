// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../commonBloc/blocTab/bloctab_bloc.dart';

import '../../home_screen.dart';
import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';

Widget buttomBar(BuildContext context,{bool ismain=false}) {
  return BlocConsumer<LandingPageBloc, LandingPageState>(
    listener: (context, state) {},
    builder: (context, state) {

        return BottomNavigationBar(
          unselectedLabelStyle: style12w400b,
          selectedLabelStyle: style12w400w,
            backgroundColor: const Color(0xffB81521),
            iconSize: 20,
            showUnselectedLabels: true,
            unselectedItemColor:const Color(0xffFF7979),
            // unselectedIconTheme: const IconThemeData(color: Color(0xffBF7C97)),
            //selectedFontSize: 50,
            unselectedFontSize: 14,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AssetImages.box,
                    color: Colors.white,
                  ),
                  icon: SvgPicture.asset(
                    AssetImages.box,
                    color: const Color(0xffFF7979),
                  ),
                  label: 'Application',
                  backgroundColor: AppColor.appbarcolor),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AssetImages.msg,
                    color: Colors.white,
                  ),
                  icon: SvgPicture.asset(
                    AssetImages.msg,
                    color: const Color(0xffFF7979),
                  ),
                  label: 'Chat',
                  backgroundColor: AppColor.appbarcolor),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                   AssetImages.home,
                    color: Colors.white,
                  ),
                  icon: SvgPicture.asset(
                      AssetImages.home,
                    color: const Color(0xffFF7979),
                  ),
                  label: "Home",
                  backgroundColor: AppColor.appbarcolor),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                   AssetImages
                        .announce,
                    color: Colors.white,
                  ),
                  icon: SvgPicture.asset( AssetImages.announce,
                    color: const Color(0xffFF7979),
                  ),
                  label: "Announcement",
                  backgroundColor: AppColor.appbarcolor),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AssetImages.profile1,
                  color: Colors.white,
                ),
                icon: SvgPicture.asset(
                  AssetImages.profile1,
                  color: const Color(0xffFF7979),
                ),
                label: 'Profile',
                backgroundColor: AppColor.appbarcolor,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: state.tabIndex,
            selectedItemColor: Colors.white,
            onTap: (index) {


              if(ismain){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  HomeScreen(
                          index: index,
                        )));
              }else{
                context.read<LandingPageBloc>().add(TabChange(tabIndex: index));
              }

            },
            elevation: 5);

    },
  );
}
