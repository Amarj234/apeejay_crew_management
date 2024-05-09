/// status : true
/// message : "OTP was sent to your email successfully."
/// data : {"email_otp":3434}

class EmailOtp {
  EmailOtp({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  EmailOtp.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
EmailOtp copyWith({  bool? status,
  String? message,
  Data? data,
}) => EmailOtp(  status: status ?? _status,
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

/// email_otp : 3434

class Data {
  Data({
      num? emailOtp,}){
    _emailOtp = emailOtp;
}

  Data.fromJson(dynamic json) {
    _emailOtp = json['email_otp'];
  }
  num? _emailOtp;
Data copyWith({  num? emailOtp,
}) => Data(  emailOtp: emailOtp ?? _emailOtp,
);
  num? get emailOtp => _emailOtp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email_otp'] = _emailOtp;
    return map;
  }

}