import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/availableJob.dart';
import '../../success/thank_you.dart';

part 'available_event.dart';
part 'available_state.dart';

class AvailableBloc extends Bloc<AvailableEvent, AvailableState> {
  AvailableBloc() : super(AvailableInitial()) {
    bool isrequest =true;
    on<Getavljob>((event, emit) async {
      // TODO: implement event handler
      if(isrequest) {
        isrequest=false;
      emit(Availablejobload());
      try {
        var res = await Api().getReq("job-list");
        AvailableJob api = AvailableJob.fromJson(jsonDecode(res!.body));
        emit(AvailableLoded(api));
        isrequest=true;
      } catch (e) {
        emit(AvailableError("$e"));
        isrequest=true;
      }}
    });

    on<JobSearch>((event, emit) async {
      // TODO: implement event handler
      if(isrequest) {
        isrequest = false;
        emit(jobdetailsload());
        try {
          if (event.val == "") {
            var res = await Api().getReq("job-list");
            AvailableJob api = AvailableJob.fromJson(jsonDecode(res!.body));
            emit(AvailableLoded(api));
            isrequest=true;
          } else {
            var res = await Api().postReq({
              "search": event.val
            }, "job-search");
            // JobDetails api = JobDetails.fromJson(jsonDecode(res!.body));
            AvailableJob api = AvailableJob.fromJson(jsonDecode(res!.body));
            isrequest=true;
            emit(SearchJobLoded(api));
          }
        } catch (e) {
          isrequest=true;
          emit(AvailableError("$e"));
        }
      }
    });

    on<QuickApply>((event, emit) async {
      emit(Availablejobload());
      try {
        var res = await Api().postReq({
          "job_id":event.id.toString()
        },"apply-job" );
        var data=jsonDecode(res!.body);
       if(data['status']==true) {
         AvailableJob availableJob;
         availableJob=event.availableJob;
         int? index=  availableJob.data!.jobs!.indexWhere((element) => element.id==event.id);
         availableJob.data?.jobs?.removeAt(index);
                emit(AvailableLoded(availableJob));
         // Future.delayed(Duration(milliseconds: 500),() {
         //   EasyLoading.showSuccess(data['message']);
         //   // CostomSnackbar.show(event.context, data['message']);
         //
         // });
       //  Future.delayed(Duration(milliseconds: 500),(){
           Navigator.push(
               event.context,
               MaterialPageRoute(
                   builder: (context) => const ThankYou()));
        // });

       }else{//
         emit(AvailableLoded(event.availableJob));
           Future.delayed(const Duration(milliseconds: 500),() {
             EasyLoading.showSuccess(data['message']);
            // CostomSnackbar.show(event.context, data['message']);

           });
         // emit(AvailableSnac(data['message']));

       }
      } catch (e) {
        print("$e");
        emit(AvailableError("$e"));
      }

    });

  }
}
