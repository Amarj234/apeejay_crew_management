import 'package:apeejay_crew_management/screen/appliedjob/widget/buttom_alert.dart';
import 'package:apeejay_crew_management/screen/appliedjob/widget/jobs_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../model/applied_job.dart';
import '../commonwidget/main_appbar.dart';
import '../menu/side_menu.dart';
import 'bloc/appliedjobs_bloc.dart';

class AppliedJob extends StatefulWidget {
  const AppliedJob({super.key});

  @override
  State<AppliedJob> createState() => _AppliedJobState();
}

class _AppliedJobState extends State<AppliedJob> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppliedjobsBloc>().add(GetappliedJob());
  }

  String difrent(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
    var outputFormat = DateFormat('dd MMM,yy');
    var outputDate = outputFormat.format(parseDate);
    return outputDate.toString();
  }

  void showImagePickerOptions(Jobs job, Function() myfun) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child: ButtomAlert(
              jobs: job,
              myfun: myfun,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MainAppbar(
        context: context,
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        title: "Applied Jobs",
        leading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: BlocBuilder<AppliedjobsBloc, AppliedjobsState>(
            builder: (context, state) {
              if (state is Appliedjobsload) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AppliedjobsError) {
                return Center(
                  child: Text(
                    state.error,
                  ),
                );
              }
              if (state is Appliedjobsloded) {
                var data = state.appliedJob.data?.jobs;
                return data!.isEmpty
                    ? const Center(child: Text("List Not found"))
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return JobsApp(
                            location: data[index].job!.serviceType.toString(),
                            jobtime: data[index].job!.jobType.toString(),
                            subtitle: data[index].job!.description.toString(),
                            title: data[index].job!.title.toString(),
                            date:
                                difrent(data[index].job!.createdAt.toString()),
                            sno: data[index].job!.jobId.toString(),
                            status: data[index].status!,
                            myfun: () {

                              showImagePickerOptions(data[index], () {
                                print(data[index].job!.id);
                                context.read<AppliedjobsBloc>().add(QuickRemove(
                                    data[index].job!.id!, state.appliedJob));
                                Navigator.pop(context);
                              });
                            },
                          );
                        });
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
