/// status : false
/// errors : {"email":["The email has already been taken."],"phone":["The phone has already been taken."],"indos_number":["The indos number must be 8 characters."]}

class RegisterError1 {
  RegisterError1({
      bool? status, 
      Errors? errors,}){
    _status = status;
    _errors = errors;
}

  RegisterError1.fromJson(dynamic json) {
    _status = json['status'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool? _status;
  Errors? _errors;
RegisterError1 copyWith({  bool? status,
  Errors? errors,
}) => RegisterError1(  status: status ?? _status,
  errors: errors ?? _errors,
);
  bool? get status => _status;
  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }

}

/// email : ["The email has already been taken."]
/// phone : ["The phone has already been taken."]
/// indos_number : ["The indos number must be 8 characters."]

class Errors {
  Errors({
      List<String>? email, 
      List<String>? phone, 
      List<String>? indosNumber,}){
    _email = email;
    _phone = phone;
    _indosNumber = indosNumber;
}

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    _indosNumber = json['indos_number'] != null ? json['indos_number'].cast<String>() : [];
  }
  List<String>? _email;
  List<String>? _phone;
  List<String>? _indosNumber;
Errors copyWith({  List<String>? email,
  List<String>? phone,
  List<String>? indosNumber,
}) => Errors(  email: email ?? _email,
  phone: phone ?? _phone,
  indosNumber: indosNumber ?? _indosNumber,
);
  List<String>? get email => _email;
  List<String>? get phone => _phone;
  List<String>? get indosNumber => _indosNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['indos_number'] = _indosNumber;
    return map;
  }

}