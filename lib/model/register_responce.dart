/// status : true
/// message : "OTP was sent to your phone number and email successfully."
/// data : {"otp":1921,"email_otp":7158,"indos_details":{"Name":"RAJAN KENNETH RAJAN","Date_of_Birth":"10-NOV-1971","INDoS_No":"99NL1171","Passport_No":"Z6044260","Passport_Issue_Date":"08-MAR-2021","Passport_Valid_To":"07-MAR-2031","CDC_No":"MUM 94206","CDC_Issue_Date":"25-MAY-2022","CDC_Valid_To":"24-MAY-2032","CDC_Issue_Place":"Mumbai"}}

class RegisterResponce {
  RegisterResponce({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RegisterResponce.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
RegisterResponce copyWith({  bool? status,
  String? message,
  Data? data,
}) => RegisterResponce(  status: status ?? _status,
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

/// otp : 1921
/// email_otp : 7158
/// indos_details : {"Name":"RAJAN KENNETH RAJAN","Date_of_Birth":"10-NOV-1971","INDoS_No":"99NL1171","Passport_No":"Z6044260","Passport_Issue_Date":"08-MAR-2021","Passport_Valid_To":"07-MAR-2031","CDC_No":"MUM 94206","CDC_Issue_Date":"25-MAY-2022","CDC_Valid_To":"24-MAY-2032","CDC_Issue_Place":"Mumbai"}

class Data {
  Data({
      num? otp, 
      num? emailOtp, 
      IndosDetails? indosDetails,}){
    _otp = otp;
    _emailOtp = emailOtp;
    _indosDetails = indosDetails;
}

  Data.fromJson(dynamic json) {
    _otp = json['otp'];
    _emailOtp = json['email_otp'];
    _indosDetails = json['indos_details'] != null ? IndosDetails.fromJson(json['indos_details']) : null;
  }
  num? _otp;
  num? _emailOtp;
  IndosDetails? _indosDetails;
Data copyWith({  num? otp,
  num? emailOtp,
  IndosDetails? indosDetails,
}) => Data(  otp: otp ?? _otp,
  emailOtp: emailOtp ?? _emailOtp,
  indosDetails: indosDetails ?? _indosDetails,
);
  num? get otp => _otp;
  num? get emailOtp => _emailOtp;
  IndosDetails? get indosDetails => _indosDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = _otp;
    map['email_otp'] = _emailOtp;
    if (_indosDetails != null) {
      map['indos_details'] = _indosDetails?.toJson();
    }
    return map;
  }

}

/// Name : "RAJAN KENNETH RAJAN"
/// Date_of_Birth : "10-NOV-1971"
/// INDoS_No : "99NL1171"
/// Passport_No : "Z6044260"
/// Passport_Issue_Date : "08-MAR-2021"
/// Passport_Valid_To : "07-MAR-2031"
/// CDC_No : "MUM 94206"
/// CDC_Issue_Date : "25-MAY-2022"
/// CDC_Valid_To : "24-MAY-2032"
/// CDC_Issue_Place : "Mumbai"

class IndosDetails {
  IndosDetails({
      String? name, 
      String? dateOfBirth, 
      String? iNDoSNo, 
      String? passportNo, 
      String? passportIssueDate, 
      String? passportValidTo, 
      String? cDCNo, 
      String? cDCIssueDate, 
      String? cDCValidTo, 
      String? cDCIssuePlace,}){
    _name = name;
    _dateOfBirth = dateOfBirth;
    _iNDoSNo = iNDoSNo;
    _passportNo = passportNo;
    _passportIssueDate = passportIssueDate;
    _passportValidTo = passportValidTo;
    _cDCNo = cDCNo;
    _cDCIssueDate = cDCIssueDate;
    _cDCValidTo = cDCValidTo;
    _cDCIssuePlace = cDCIssuePlace;
}

  IndosDetails.fromJson(dynamic json) {
    _name = json['Name'];
    _dateOfBirth = json['Date_of_Birth'];
    _iNDoSNo = json['INDoS_No'];
    _passportNo = json['Passport_No'];
    _passportIssueDate = json['Passport_Issue_Date'];
    _passportValidTo = json['Passport_Valid_To'];
    _cDCNo = json['CDC_No'];
    _cDCIssueDate = json['CDC_Issue_Date'];
    _cDCValidTo = json['CDC_Valid_To'];
    _cDCIssuePlace = json['CDC_Issue_Place'];
  }
  String? _name;
  String? _dateOfBirth;
  String? _iNDoSNo;
  String? _passportNo;
  String? _passportIssueDate;
  String? _passportValidTo;
  String? _cDCNo;
  String? _cDCIssueDate;
  String? _cDCValidTo;
  String? _cDCIssuePlace;
IndosDetails copyWith({  String? name,
  String? dateOfBirth,
  String? iNDoSNo,
  String? passportNo,
  String? passportIssueDate,
  String? passportValidTo,
  String? cDCNo,
  String? cDCIssueDate,
  String? cDCValidTo,
  String? cDCIssuePlace,
}) => IndosDetails(  name: name ?? _name,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  iNDoSNo: iNDoSNo ?? _iNDoSNo,
  passportNo: passportNo ?? _passportNo,
  passportIssueDate: passportIssueDate ?? _passportIssueDate,
  passportValidTo: passportValidTo ?? _passportValidTo,
  cDCNo: cDCNo ?? _cDCNo,
  cDCIssueDate: cDCIssueDate ?? _cDCIssueDate,
  cDCValidTo: cDCValidTo ?? _cDCValidTo,
  cDCIssuePlace: cDCIssuePlace ?? _cDCIssuePlace,
);
  String? get name => _name;
  String? get dateOfBirth => _dateOfBirth;
  String? get iNDoSNo => _iNDoSNo;
  String? get passportNo => _passportNo;
  String? get passportIssueDate => _passportIssueDate;
  String? get passportValidTo => _passportValidTo;
  String? get cDCNo => _cDCNo;
  String? get cDCIssueDate => _cDCIssueDate;
  String? get cDCValidTo => _cDCValidTo;
  String? get cDCIssuePlace => _cDCIssuePlace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Date_of_Birth'] = _dateOfBirth;
    map['INDoS_No'] = _iNDoSNo;
    map['Passport_No'] = _passportNo;
    map['Passport_Issue_Date'] = _passportIssueDate;
    map['Passport_Valid_To'] = _passportValidTo;
    map['CDC_No'] = _cDCNo;
    map['CDC_Issue_Date'] = _cDCIssueDate;
    map['CDC_Valid_To'] = _cDCValidTo;
    map['CDC_Issue_Place'] = _cDCIssuePlace;
    return map;
  }

}