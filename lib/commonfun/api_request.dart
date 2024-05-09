import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../config/baseUrl.dart';
import '../config/sharedPrefs.dart';


class Api {

 Future<Response?> postReq(Map body,String url)async{
   UserPrefs prefs=UserPrefs();
   String token= prefs.getData("token")??"";
print("$body" "===="  "$url");
try {
  Response response = await http.post(Uri.parse(baseUrl + url), body: body,headers: {
    "Authorization":"Bearer $token"
  });
  print(response.body);
  return response;
}catch(e){
  return null;
}
  }


 Future<Response?> getReq(String url)async{
   UserPrefs prefs=UserPrefs();
 String token= prefs.getData("token")??"";
   try {
     Response response = await http.post(Uri.parse(baseUrl + url),headers: {
       "Authorization":"Bearer $token"
     });

     print("${response.body}" "===="  "$url");
     return response;
   }catch(e){
     return null;
   }
 }

}