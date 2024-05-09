import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../commonwidget/main_appbar.dart';
import '../menu/side_menu.dart';
import 'bloc/announcements_bloc.dart';
import 'widget/announcement_list.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnnouncementsBloc>().add(Getannouncement());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(context: context,
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        leading: true,
        title: "Announcement",
      ),
      body: SafeArea(
        child: BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
          builder: (context, state) {
            if(state is Announcementsload){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is AnnouncementsError){
              return Center(child: Text(state.error,),);
            }
            if(state is Announcementsloded){
              var data=state.announcementsModel.data?.announcements;

              return data!.isEmpty?const Center(child: Text("List Not found")): Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return  AnnouncementList(announcements: data[index],);
                    }),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
