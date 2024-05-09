import 'package:get_storage/get_storage.dart';

class UserPrefs {
  final box = GetStorage();

  final userToken = 'token';
  final fcmtoken = 'fcmToken';

  List cartlist = [];

  //============================================



  void setToken(String token) {
    box.write(userToken, token);
  }

  String? getToken() {
    return box.read(userToken);
  }

  setData(String key, String val) {
    box.write(key, val);
  }

  setInt(String key, int val) {
    box.write(key, val);
  }

  int? getInt(String key) {
    return box.read(key);
  }

void remove(String key) {
     box.remove(key);
  }

  String? getData(String key) {
    return box.read(key);
  }

  String? getFCMToken() {
    return box.read(fcmtoken);
  }

  clearPrefs() async {
    await box.erase();
  }
}
