// ignore_for_file: use_build_context_synchronously

import 'package:apeejay_crew_management/config/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/sharedPrefs.dart';
import '../../home_screen.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../login/login_screen.dart';
import '../notification/notification_Screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, this.isnitification = false}) : super(key: key);
  final bool isnitification;
  @override
  Widget build(BuildContext context) {
    UserPrefs prefs = UserPrefs();
    return Drawer(
      width: MediaQuery.of(context).size.width - 50,
      backgroundColor: const Color(0xffB81521),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(AssetImages.cross)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 15, bottom: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "${baseImgUrl}picture/${prefs.getData("profilePhoto")}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: ListTile(
                          title: Text(prefs.getData("name").toString(),
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              )),
                          subtitle: Text(prefs.getData("email").toString(),
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xffFF8F97),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 1,
                width: double.infinity,
                color: const Color(0xffCF1E2B),
              ),
              menuitem("Home", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 2,
                            )));
              }),
              menuitem("Profile", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 4,
                            )));
              }),
              menuitem("Availability", () {
                // Navigator.pop(context);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) =>  Availability_Form()));
              }),
              menuitem("Jobs", () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const HomeScreen(
                //               index: 1,
                //             )));
              }),
              menuitem("Applied Jobs", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 0,
                            )));
              }),
              menuitem("Chat", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 1,
                            )));
              }),
              menuitem("Notification", () {
                if (isnitification) {
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                }
              }),
              menuitem("Privacy policy", () async {
                final Uri _url =
                    Uri.parse('https://aquaninjas.in/information/privacy.php');
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              }),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 1,
                width: double.infinity,
                color: const Color(0xffCF1E2B),
              ),
              menuitem("Apeejay Announcements", () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              index: 3,
                            )));
              }),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: InkWell(
                  onTap: () async {
                    UserPrefs prefs = UserPrefs();
                    await prefs.clearPrefs();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AssetImages.logout,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: style18w400w,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuitem(String txt, Function() myfun) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(
        const Color(0xffCF1E2B),
      ),
      onTap: myfun,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, top: 12, bottom: 12),
            child: Text(
              txt,
              style: style18w400w,
            ),
          ),
        ],
      ),
    );
  }
}
