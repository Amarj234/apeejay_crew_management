/// status : true
/// message : "Login successful."
/// data : {"token":"4|auVznXN680NUDiZeQ18H5IRQcS5RYFLxsPYa99U8"}

class PhoneVerify {
  PhoneVerify({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PhoneVerify.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
PhoneVerify copyWith({  bool? status,
  String? message,
  Data? data,
}) => PhoneVerify(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// token : "4|auVznXN680NUDiZeQ18H5IRQcS5RYFLxsPYa99U8"

class Data {
  Data({
      String? token,}){
    _token = token;
    _userStatus = userStatus;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _userStatus = json['user_status'];
  }
  num? _userStatus ;
  String? _token;
Data copyWith({  String? token,
}) => Data(  token: token ?? _token,
);
  String? get token => _token;
  num? get userStatus => _userStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['user_status'] = _token;
    return map;
  }

}