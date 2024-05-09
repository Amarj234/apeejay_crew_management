/// status : false
/// errors : {"name":["The name field is required."],"email":["The email field is required."],"phone":["The phone field is required."],"dob":["The dob field is required."],"indos_number":["The indos number field is required."],"passport_number":["The passport number field is required."],"blood_group":["The blood group field is required."],"pan":["The pan field is required."]}

class ProfileError {
  ProfileError({
      bool? status, 
      Errors? errors,}){
    _status = status;
    _errors = errors;
}

  ProfileError.fromJson(dynamic json) {
    _status = json['status'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool? _status;
  Errors? _errors;
ProfileError copyWith({  bool? status,
  Errors? errors,
}) => ProfileError(  status: status ?? _status,
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

/// name : ["The name field is required."]
/// email : ["The email field is required."]
/// phone : ["The phone field is required."]
/// dob : ["The dob field is required."]
/// indos_number : ["The indos number field is required."]
/// passport_number : ["The passport number field is required."]
/// blood_group : ["The blood group field is required."]
/// pan : ["The pan field is required."]

class Errors {
  Errors({
      List<String>? name, 
      List<String>? email, 
      List<String>? phone, 
      List<String>? dob, 
      List<String>? indosNumber, 
      List<String>? passportNumber, 
      List<String>? bloodGroup, 
      List<String>? pan,}){
    _name = name;
    _email = email;
    _phone = phone;
    _dob = dob;
    _indosNumber = indosNumber;
    _passportNumber = passportNumber;
    _bloodGroup = bloodGroup;
    _pan = pan;
}

  Errors.fromJson(dynamic json) {
    _name = json['name'] != null ? json['name'].cast<String>() : [];
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    _dob = json['dob'] != null ? json['dob'].cast<String>() : [];
    _indosNumber = json['indos_number'] != null ? json['indos_number'].cast<String>() : [];
    _passportNumber = json['passport_number'] != null ? json['passport_number'].cast<String>() : [];
    _bloodGroup = json['blood_group'] != null ? json['blood_group'].cast<String>() : [];
    _pan = json['pan'] != null ? json['pan'].cast<String>() : [];
  }
  List<String>? _name;
  List<String>? _email;
  List<String>? _phone;
  List<String>? _dob;
  List<String>? _indosNumber;
  List<String>? _passportNumber;
  List<String>? _bloodGroup;
  List<String>? _pan;
Errors copyWith({  List<String>? name,
  List<String>? email,
  List<String>? phone,
  List<String>? dob,
  List<String>? indosNumber,
  List<String>? passportNumber,
  List<String>? bloodGroup,
  List<String>? pan,
}) => Errors(  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  dob: dob ?? _dob,
  indosNumber: indosNumber ?? _indosNumber,
  passportNumber: passportNumber ?? _passportNumber,
  bloodGroup: bloodGroup ?? _bloodGroup,
  pan: pan ?? _pan,
);
  List<String>? get name => _name;
  List<String>? get email => _email;
  List<String>? get phone => _phone;
  List<String>? get dob => _dob;
  List<String>? get indosNumber => _indosNumber;
  List<String>? get passportNumber => _passportNumber;
  List<String>? get bloodGroup => _bloodGroup;
  List<String>? get pan => _pan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['dob'] = _dob;
    map['indos_number'] = _indosNumber;
    map['passport_number'] = _passportNumber;
    map['blood_group'] = _bloodGroup;
    map['pan'] = _pan;
    return map;
  }

}