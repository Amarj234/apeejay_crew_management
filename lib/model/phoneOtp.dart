/// status : true
/// message : "OTP was sent to your phone number successfully."
/// data : {"otp":9478}

class PhoneOtp {
  PhoneOtp({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PhoneOtp.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
PhoneOtp copyWith({  bool? status,
  String? message,
  Data? data,
}) => PhoneOtp(  status: status ?? _status,
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

/// otp : 9478

class Data {
  Data({
      num? otp,}){
    _otp = otp;
}

  Data.fromJson(dynamic json) {
    _otp = json['otp'];
  }
  num? _otp;
Data copyWith({  num? otp,
}) => Data(  otp: otp ?? _otp,
);
  num? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = _otp;
    return map;
  }

}