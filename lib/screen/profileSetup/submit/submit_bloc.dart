import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../commonfun/api_request.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/userDetails.dart';
part 'submit_event.dart';
part 'submit_state.dart';

class SubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  SubmitBloc() : super(SubmitInitial()) {
    bool isrequest =true;
    on<SubmitForm>((event, emit) async {
      emit(Submitload());
      //Future.delayed(Duration(milliseconds: 500),()async{
      UserPrefs prefs = UserPrefs();
      Map availabile = jsonDecode(prefs.getData("availabile") ?? "{}");
      Map allimage = jsonDecode(prefs.getData("allimage") ?? "{}");
      Map profilesetup = jsonDecode(prefs.getData("profilesetup") ?? "{}");
      Map saftykit = jsonDecode(prefs.getData("saftykit") ?? "{}");
      Map bank = jsonDecode(prefs.getData("bank") ?? "{}");
      final banklistk = bank.keys.toList();
      final banklistv = bank.values.toList();
      final allimagek = allimage.keys.toList();
      final saftykitk = saftykit.keys.toList();
      final allimagev = allimage.values.toList();
      final saftykitv = saftykit.values.toList();
      final availabilek = availabile.keys.toList();
      final availabilev = availabile.values.toList();
      final profilesetupk = profilesetup.keys.toList();
      final profilesetupv = profilesetup.values.toList();

      try {
        var request = http.MultipartRequest(
            "POST", Uri.parse(baseUrl + "profile-update"));

        request.headers['Content-Type'] = "multipart/form-data";
        for (int i = 0; i < banklistk.length; i++) {
          if (banklistv[i] != null) {
            request.fields[banklistk[i]] = banklistv[i];
          }
        }
        for (int i = 0; i < availabilek.length; i++) {
          if (availabilev[i] != null) {
            request.fields[availabilek[i]] = availabilev[i].toString();
            print("$i avalable ${availabilev[i]}");
          }
        }
        for (int i = 0; i < profilesetupk.length; i++) {
          if (profilesetupv[i] != null) {
            request.fields[profilesetupk[i]] = profilesetupv[i];
          }
        }
        for (int i = 0; i < saftykitk.length; i++) {
          if (saftykitv[i] != null) {
            request.fields[saftykitk[i]] = saftykitv[i];
          }
        }
        for (int i = 0; i < allimagek.length; i++) {
          if (allimagev[i] != null) {
            request.files.add(await http.MultipartFile.fromPath(
              allimagek[i],
              allimagev[i],
              //contentType: new MediaType('application', 'x-tar'),
            ));
          }
        }

        request.fields["data_edit_permission"] = "1";

        var response = await request.send();
        //  emit(SubmitSuccess());
        var res = await http.Response.fromStream(response);
        final data = jsonDecode(res.body);
        print(res.body);
        if (response.statusCode == 200) {
          if (data["status"] == true) {
            emit(SubmitSuccess());

            print("Uploaded!");
          } else {
            emit(SubmitInitial());
            EasyLoading.showError(data["message"]);
            // emit(SubmitError(data["message"].toString()));
          }
        } else {
          emit(SubmitInitial());
         // EasyLoading.showError("Error Status code ${response.statusCode}");
        }
        if (data["status"] == false) {
          emit(SubmitInitial());
          EasyLoading.showError(data["message"]);
        }
      } catch (e) {
        emit(SubmitInitial());
        EasyLoading.showError("$e");
      }

      //});
      // TODO: implement event handler
    });

    on<UpdateForm>((event, emit) async {
      print("Submitload");

      EasyLoading.show(status: 'loading...');

      //   Future.delayed(Duration(milliseconds: 500),()async{
      UserPrefs prefs = UserPrefs();
      Map availabile = jsonDecode(prefs.getData("availabile") ?? "{}");
      Map allimage = jsonDecode(prefs.getData("allimage") ?? "{}");
      Map profilesetup = jsonDecode(prefs.getData("profilesetup") ?? "{}");
      Map saftykit = jsonDecode(prefs.getData("saftykit") ?? "{}");
      Map bank = jsonDecode(prefs.getData("bank") ?? "{}");
      final banklistk = bank.keys.toList();
      final banklistv = bank.values.toList();
      final allimagek = allimage.keys.toList();
      final saftykitk = saftykit.keys.toList();
      final allimagev = allimage.values.toList();
      final saftykitv = saftykit.values.toList();
      final availabilek = availabile.keys.toList();
      final availabilev = availabile.values.toList();
      final profilesetupk = profilesetup.keys.toList();
      final profilesetupv = profilesetup.values.toList();
      String token = prefs.getData("token") ?? "";
      try {
        var request = http.MultipartRequest(
            "POST", Uri.parse(baseUrl + "profile-update"));
        request.headers['Authorization'] = "Bearer $token";
        request.headers['Content-Type'] = "multipart/form-data";
        for (int i = 0; i < banklistk.length; i++) {
          if (banklistv[i] != null) {
            request.fields[banklistk[i]] = banklistv[i];
          }
        }
        for (int i = 0; i < availabilek.length; i++) {
          if (availabilev[i] != null) {
            request.fields[availabilek[i]] = availabilev[i].toString();
            print("$i avalable ${availabilev[i]}");
          }
        }
        for (int i = 0; i < profilesetupk.length; i++) {
          if (profilesetupv[i] != null) {
            request.fields[profilesetupk[i]] = profilesetupv[i];
          }
        }
        for (int i = 0; i < saftykitk.length; i++) {
          if (saftykitv[i] != null) {
            request.fields[saftykitk[i]] = saftykitv[i];
          }
        }
        for (int i = 0; i < allimagek.length; i++) {
          if (allimagev[i] != null) {
            request.files.add(await http.MultipartFile.fromPath(
              allimagek[i],
              allimagev[i],
              //contentType: new MediaType('application', 'x-tar'),
            ));
          }
        }

        var response = await request.send();
        //  emit(SubmitSuccess());
        var res = await http.Response.fromStream(response);
        final data = jsonDecode(res.body);
        print(res.body);
        if (response.statusCode == 200) {
          if (data["status"] == true) {
            prefs.remove("allimage");

            EasyLoading.showSuccess('Update Success!');
            var res = await Api().getReq("user-details");
            UserDetails api = UserDetails.fromJson(jsonDecode(res!.body));

            prefs.setData("name", api.data!.details!.name.toString());
            prefs.setData(
                "profilePhoto", api.data!.details!.profilePhoto.toString());
            prefs.setData("email", api.data!.details!.email.toString());
            emit(Profileloaded(api));
            print("Uploaded!");
          } else {
            emit(SubmitError(data["message"].toString()));
          }
        }
        if (data["status"] == false) {
          EasyLoading.showError(data["message"]);
        }
      } catch (e) {
        print("$e");
        EasyLoading.showError('Failed with $e');
        // emit(SubmitError("$e"));
      }

      //  });
      // TODO: implement event handler
    });

    on<GetProfile>((event, emit) async {
      if(isrequest) {
        isrequest=false;
      emit(Profileload());
      try {
        var res = await Api().getReq("user-details");
        if(res!.statusCode==200){

        UserDetails api = UserDetails.fromJson(jsonDecode(res.body));
        UserPrefs prefs = UserPrefs();
        prefs.setData("name", api.data!.details!.name.toString());
        prefs.setData(
            "profilePhoto", api.data!.details!.profilePhoto.toString());
        prefs.setData("email", api.data!.details!.email.toString());
        emit(Profileloaded(api));
        isrequest=true;
        // Future.delayed(Duration(seconds: 2),(){
        //   emit(SubmitInitial());
        // });
        }else{
          isrequest=true;
         // EasyLoading.showError("Error Status code ${res.statusCode}");
        }
      } catch (e) {
        isrequest=true;
        emit(ProfileError("$e"));
      }}
    });

    on<ForIntstate>((event, emit) {
      emit(SubmitInitial());
    });
  }
}
