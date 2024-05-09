import 'package:apeejay_crew_management/screen/mainpage/avlBloc/available_bloc.dart';
import 'package:apeejay_crew_management/screen/mainpage/widget/jobs_avl.dart';
import 'package:apeejay_crew_management/utils/color.dart';
import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../model/availableJob.dart';
import '../commonwidget/main_appbar.dart';
import '../menu/side_menu.dart';
import 'widget/buttom_alert.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void showImagePickerOptions(Jobs job,Function() myfun) {

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return  FractionallySizedBox(
            heightFactor: 0.9, child: ButtomAlert(jobs: job, myfun: myfun,));
      },
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AvailableBloc>().add(Getavljob());
  }

  String difrent(String date) {
    DateTime parseDate = DateFormat("dd/MM/yyyy").parse(date);
    var outputFormat = DateFormat('dd MMM,yy');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(
        context: context,
        ontap: () {
          if (kDebugMode) {
            print("object");
          }
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container
                  (
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(.04),width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(-1, 0),
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 8.0,
                        ),
                      ]),
                  child: TextFormField(
                    onChanged: (v){
                      context.read<AvailableBloc>().add(JobSearch(v));
                    },
                    decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          AssetImages.search,
                          width: 20,
                          height: 20,
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 10),
                        hintText: "Job title, Keywords, or Job description",
                        hintStyle:
                            const TextStyle(fontSize: 12, color: AppColor.main),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text("Available Jobs",
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color:  Colors.black,
                    )),
                const SizedBox(
                  height: 5,
                ),
                BlocConsumer<AvailableBloc, AvailableState>(
                  listener: (context, state) {
                    // if(state is AvailableSnac){
                    //   CostomSnackbar.show(context, state.error);
                    // }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is Availablejobload) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is AvailableError) {
                      return Center(
                        child: Text(state.error),
                      );
                    }
                    if (state is SearchJobLoded) {
                      var data = state.availableJob.data?.jobs!;

                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 220,
                        child:data!.isEmpty?const Center(child: Text("List Not found")): ListView.builder(
                          // shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) => JobsAvl(
                              location: data[index].serviceType.toString(),
                              jobtime: data[index].jobType.toString(),
                              quick: () {
                                context.read<AvailableBloc>().add(
                                    QuickApply(data[index].id!,
                                        context1,state.availableJob));
                              },
                              detaild: () {
                                showImagePickerOptions(data[index],(){

                                  context.read<AvailableBloc>().add(
                                      QuickApply(data[index].id!,
                                          context1,state.availableJob));
                                  Navigator.pop(context);
                                });
                              },
                              subtitle: data[index].description.toString(),
                              title: data[index].title.toString(),
                              date: difrent(data[index].lastApplyDate.toString()),
                              sno: data[index].jobId.toString(),
                            )),
                      );
                    }

                    if (state is AvailableLoded) {
                      var data = state.availableJob.data?.jobs;

                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 270,
                        child:data==null?const Center(child: Text("List Not found")): ListView.builder(
                            // shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) => JobsAvl(
                                  location: data[index].serviceType.toString(),
                                  jobtime: data[index].jobType.toString(),
                                  quick: () {
                                    context.read<AvailableBloc>().add(
                                        QuickApply(data[index].id!,
                                            context1,state.availableJob));
                                  },
                                  detaild: () {
                                    showImagePickerOptions(data[index],(){

                                      context.read<AvailableBloc>().add(
                                          QuickApply(data[index].id!,
                                              context1,state.availableJob));
                                      Navigator.pop(context);
                                    });
                                  },
                                  subtitle: data[index].description.toString(),
                                  title: data[index].title.toString(),
                                  date: difrent(data[index].lastApplyDate.toString()),
                                  sno: data[index].jobId.toString(),
                                )),
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(height: 70,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
