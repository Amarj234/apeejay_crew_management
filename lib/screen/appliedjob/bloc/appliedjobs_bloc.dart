import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../../commonfun/api_request.dart';
import '../../../model/applied_job.dart';

part 'appliedjobs_event.dart';
part 'appliedjobs_state.dart';

class AppliedjobsBloc extends Bloc<AppliedjobsEvent, AppliedjobsState> {
  AppliedjobsBloc() : super(AppliedjobsInitial()) {
    bool isrequest =true;
    on<GetappliedJob>((event, emit) async {
      // TODO: implement event handler
      if(isrequest) {
        isrequest = false;
        emit(Appliedjobsload());
        try {
          var res = await Api().getReq("applied-job-list");
          if (res!.statusCode == 200) {
            AppliedJob api = AppliedJob.fromJson(jsonDecode(res.body));

            emit(Appliedjobsloded(api));
            isrequest=true;
          } else {
            isrequest=true;
            // EasyLoading.showError("Error Status code ${res.statusCode}");
          }
        } catch (e) {
          isrequest=true;
          emit(AppliedjobsError("$e"));
        }
      }
    });


    on<QuickRemove>((event, emit) async {

      try {
        var res = await Api().postReq({
          "job_id":event.id.toString()
        },"remove-applied-job" );
        var data=jsonDecode(res!.body);
        if(data['status']==true) {
          AppliedJob appliedJob;
          appliedJob=event.appliedJob;
          int index= appliedJob.data!.jobs!.indexWhere((element) => element.job?.id==event.id);

          print(" index234 $index");
          appliedJob.data?.jobs?.removeAt(index);
          emit(Appliedjobsloded(appliedJob));

          EasyLoading.showSuccess(data['message']);
        }else{
          emit(Appliedjobsloded(event.appliedJob));
            EasyLoading.showError(data['message']);
        }
      } catch (e) {
        print("$e");
        emit(AppliedjobsError("$e"));
      }

    });
  }
}
