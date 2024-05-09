/// status : true
/// message : "Applied job list."
/// data : {"jobs":[{"id":11,"job_id":5,"user_id":1,"applied_date":"2024-01-29 13:16:43","status":0,"created_at":"2024-01-29T13:16:43.000000Z","updated_at":"2024-01-29T13:16:43.000000Z","job":{"id":5,"job_id":"APJS-20247705","title":"Test","job_type":"Full-time","position":"Crew","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":2,"duration_month":6,"duration_day":5,"last_apply_date":"19/02/2024","vancancy":10,"salary_range":"3000 - 22000","created_at":"2024-01-04T04:37:43.000000Z","updated_at":"2024-01-29T06:40:37.000000Z"},"user":{"id":1,"name":"Anna Wella","email":"anna@test.com","email_verified_at":null,"phone":"123344566","otp":null,"otp_expired_at":null,"email_otp":null,"dob":"1981-01-15","indos_number":"SEE434DS","passport_number":"SWQW34443","qualification":null,"profile_photo":null,"blood_group":"AB+","pan":"DDSDF","resume":null,"uniform_size":"M","foot_size":"10","available_from":"2024-01-15","available_to":"2024-05-10","preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"status":1,"passport":"1704728331.pdf","cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"fcm_token":null,"created_at":"2023-12-21T09:08:30.000000Z","updated_at":"2024-01-08T15:38:51.000000Z"}},{"id":5,"job_id":2,"user_id":1,"applied_date":"2024-01-04 12:00:11","status":0,"created_at":"2024-01-05T12:01:47.000000Z","updated_at":"2024-01-05T14:40:18.000000Z","job":{"id":2,"job_id":"APJS20231","title":"Test","job_type":"Full-time","position":"Captain","description":"This is a description for the job","eligibility":"This is a description for the job","travel_details":"This is a description for the job","service_type":"On Shore","duration":"12 Month","duration_year":0,"duration_month":12,"duration_day":0,"last_apply_date":"29/12/2023","vancancy":12,"salary_range":null,"created_at":"2023-12-29T11:20:41.000000Z","updated_at":"2024-01-05T14:38:57.000000Z"},"user":{"id":1,"name":"Anna Wella","email":"anna@test.com","email_verified_at":null,"phone":"123344566","otp":null,"otp_expired_at":null,"email_otp":null,"dob":"1981-01-15","indos_number":"SEE434DS","passport_number":"SWQW34443","qualification":null,"profile_photo":null,"blood_group":"AB+","pan":"DDSDF","resume":null,"uniform_size":"M","foot_size":"10","available_from":"2024-01-15","available_to":"2024-05-10","preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"status":1,"passport":"1704728331.pdf","cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"fcm_token":null,"created_at":"2023-12-21T09:08:30.000000Z","updated_at":"2024-01-08T15:38:51.000000Z"}}]}

class AppliedJob {
  AppliedJob({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  AppliedJob.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
AppliedJob copyWith({  bool? status,
  String? message,
  Data? data,
}) => AppliedJob(  status: status ?? _status,
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

/// jobs : [{"id":11,"job_id":5,"user_id":1,"applied_date":"2024-01-29 13:16:43","status":0,"created_at":"2024-01-29T13:16:43.000000Z","updated_at":"2024-01-29T13:16:43.000000Z","job":{"id":5,"job_id":"APJS-20247705","title":"Test","job_type":"Full-time","position":"Crew","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":2,"duration_month":6,"duration_day":5,"last_apply_date":"19/02/2024","vancancy":10,"salary_range":"3000 - 22000","created_at":"2024-01-04T04:37:43.000000Z","updated_at":"2024-01-29T06:40:37.000000Z"},"user":{"id":1,"name":"Anna Wella","email":"anna@test.com","email_verified_at":null,"phone":"123344566","otp":null,"otp_expired_at":null,"email_otp":null,"dob":"1981-01-15","indos_number":"SEE434DS","passport_number":"SWQW34443","qualification":null,"profile_photo":null,"blood_group":"AB+","pan":"DDSDF","resume":null,"uniform_size":"M","foot_size":"10","available_from":"2024-01-15","available_to":"2024-05-10","preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"status":1,"passport":"1704728331.pdf","cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"fcm_token":null,"created_at":"2023-12-21T09:08:30.000000Z","updated_at":"2024-01-08T15:38:51.000000Z"}},{"id":5,"job_id":2,"user_id":1,"applied_date":"2024-01-04 12:00:11","status":0,"created_at":"2024-01-05T12:01:47.000000Z","updated_at":"2024-01-05T14:40:18.000000Z","job":{"id":2,"job_id":"APJS20231","title":"Test","job_type":"Full-time","position":"Captain","description":"This is a description for the job","eligibility":"This is a description for the job","travel_details":"This is a description for the job","service_type":"On Shore","duration":"12 Month","duration_year":0,"duration_month":12,"duration_day":0,"last_apply_date":"29/12/2023","vancancy":12,"salary_range":null,"created_at":"2023-12-29T11:20:41.000000Z","updated_at":"2024-01-05T14:38:57.000000Z"},"user":{"id":1,"name":"Anna Wella","email":"anna@test.com","email_verified_at":null,"phone":"123344566","otp":null,"otp_expired_at":null,"email_otp":null,"dob":"1981-01-15","indos_number":"SEE434DS","passport_number":"SWQW34443","qualification":null,"profile_photo":null,"blood_group":"AB+","pan":"DDSDF","resume":null,"uniform_size":"M","foot_size":"10","available_from":"2024-01-15","available_to":"2024-05-10","preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"status":1,"passport":"1704728331.pdf","cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"fcm_token":null,"created_at":"2023-12-21T09:08:30.000000Z","updated_at":"2024-01-08T15:38:51.000000Z"}}]

class Data {
  Data({
      List<Jobs>? jobs,}){
    _jobs = jobs;
}

  Data.fromJson(dynamic json) {
    if (json['jobs'] != null) {
      _jobs = [];
      json['jobs'].forEach((v) {
        _jobs?.add(Jobs.fromJson(v));
      });
    }
  }
  List<Jobs>? _jobs;
Data copyWith({  List<Jobs>? jobs,
}) => Data(  jobs: jobs ?? _jobs,
);
  List<Jobs>? get jobs => _jobs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_jobs != null) {
      map['jobs'] = _jobs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 11
/// job_id : 5
/// user_id : 1
/// applied_date : "2024-01-29 13:16:43"
/// status : 0
/// created_at : "2024-01-29T13:16:43.000000Z"
/// updated_at : "2024-01-29T13:16:43.000000Z"
/// job : {"id":5,"job_id":"APJS-20247705","title":"Test","job_type":"Full-time","position":"Crew","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":2,"duration_month":6,"duration_day":5,"last_apply_date":"19/02/2024","vancancy":10,"salary_range":"3000 - 22000","created_at":"2024-01-04T04:37:43.000000Z","updated_at":"2024-01-29T06:40:37.000000Z"}
/// user : {"id":1,"name":"Anna Wella","email":"anna@test.com","email_verified_at":null,"phone":"123344566","otp":null,"otp_expired_at":null,"email_otp":null,"dob":"1981-01-15","indos_number":"SEE434DS","passport_number":"SWQW34443","qualification":null,"profile_photo":null,"blood_group":"AB+","pan":"DDSDF","resume":null,"uniform_size":"M","foot_size":"10","available_from":"2024-01-15","available_to":"2024-05-10","preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"status":1,"passport":"1704728331.pdf","cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"fcm_token":null,"created_at":"2023-12-21T09:08:30.000000Z","updated_at":"2024-01-08T15:38:51.000000Z"}

class Jobs {
  Jobs({
      num? id,
      num? jobId,
      num? userId,
      String? appliedDate,
      num? status,
      String? createdAt,
      String? updatedAt,
      Job? job,
      User? user,}){
    _id = id;
    _jobId = jobId;
    _userId = userId;
    _appliedDate = appliedDate;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _job = job;
    _user = user;
}

  Jobs.fromJson(dynamic json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _userId = json['user_id'];
    _appliedDate = json['applied_date'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _job = json['job'] != null ? Job.fromJson(json['job']) : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  num? _jobId;
  num? _userId;
  String? _appliedDate;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  Job? _job;
  User? _user;
Jobs copyWith({  num? id,
  num? jobId,
  num? userId,
  String? appliedDate,
  num? status,
  String? createdAt,
  String? updatedAt,
  Job? job,
  User? user,
}) => Jobs(  id: id ?? _id,
  jobId: jobId ?? _jobId,
  userId: userId ?? _userId,
  appliedDate: appliedDate ?? _appliedDate,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  job: job ?? _job,
  user: user ?? _user,
);
  num? get id => _id;
  num? get jobId => _jobId;
  num? get userId => _userId;
  String? get appliedDate => _appliedDate;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Job? get job => _job;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['job_id'] = _jobId;
    map['user_id'] = _userId;
    map['applied_date'] = _appliedDate;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_job != null) {
      map['job'] = _job?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Anna Wella"
/// email : "anna@test.com"
/// email_verified_at : null
/// phone : "123344566"
/// otp : null
/// otp_expired_at : null
/// email_otp : null
/// dob : "1981-01-15"
/// indos_number : "SEE434DS"
/// passport_number : "SWQW34443"
/// qualification : null
/// profile_photo : null
/// blood_group : "AB+"
/// pan : "DDSDF"
/// resume : null
/// uniform_size : "M"
/// foot_size : "10"
/// available_from : "2024-01-15"
/// available_to : "2024-05-10"
/// preferred_contract : null
/// preferred_sailing_area : null
/// kin_name : null
/// kin_relation : null
/// kin_phone : null
/// kin_upload : null
/// city : null
/// state : null
/// nearest_airport : null
/// nearest_railway_station : null
/// status : 1
/// passport : "1704728331.pdf"
/// cdc : null
/// indos : null
/// coc : null
/// cop_watch_keeping : null
/// efa_mfa_medicare : null
/// pst_pscrb : null
/// fpff_aff : null
/// pssr : null
/// sso_stsdsd : null
/// goc : null
/// gmdss_endorsement : null
/// sid : null
/// yellow_fever : null
/// roc : null
/// arpa : null
/// ransco : null
/// btm : null
/// brm : null
/// ecdis : null
/// ers : null
/// high_voltage : null
/// covid_19_vac : null
/// fcm_token : null
/// created_at : "2023-12-21T09:08:30.000000Z"
/// updated_at : "2024-01-08T15:38:51.000000Z"

class User {
  User({
      num? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? phone, 
      dynamic otp, 
      dynamic otpExpiredAt, 
      dynamic emailOtp, 
      String? dob, 
      String? indosNumber, 
      String? passportNumber, 
      dynamic qualification, 
      dynamic profilePhoto, 
      String? bloodGroup, 
      String? pan, 
      dynamic resume, 
      String? uniformSize, 
      String? footSize, 
      String? availableFrom, 
      String? availableTo, 
      dynamic preferredContract, 
      dynamic preferredSailingArea, 
      dynamic kinName, 
      dynamic kinRelation, 
      dynamic kinPhone, 
      dynamic kinUpload, 
      dynamic city, 
      dynamic state, 
      dynamic nearestAirport, 
      dynamic nearestRailwayStation, 
      num? status, 
      String? passport, 
      dynamic cdc, 
      dynamic indos, 
      dynamic coc, 
      dynamic copWatchKeeping, 
      dynamic efaMfaMedicare, 
      dynamic pstPscrb, 
      dynamic fpffAff, 
      dynamic pssr, 
      dynamic ssoStsdsd, 
      dynamic goc, 
      dynamic gmdssEndorsement, 
      dynamic sid, 
      dynamic yellowFever, 
      dynamic roc, 
      dynamic arpa, 
      dynamic ransco, 
      dynamic btm, 
      dynamic brm, 
      dynamic ecdis, 
      dynamic ers, 
      dynamic highVoltage, 
      dynamic covid19Vac, 
      dynamic fcmToken, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
    _otp = otp;
    _otpExpiredAt = otpExpiredAt;
    _emailOtp = emailOtp;
    _dob = dob;
    _indosNumber = indosNumber;
    _passportNumber = passportNumber;
    _qualification = qualification;
    _profilePhoto = profilePhoto;
    _bloodGroup = bloodGroup;
    _pan = pan;
    _resume = resume;
    _uniformSize = uniformSize;
    _footSize = footSize;
    _availableFrom = availableFrom;
    _availableTo = availableTo;
    _preferredContract = preferredContract;
    _preferredSailingArea = preferredSailingArea;
    _kinName = kinName;
    _kinRelation = kinRelation;
    _kinPhone = kinPhone;
    _kinUpload = kinUpload;
    _city = city;
    _state = state;
    _nearestAirport = nearestAirport;
    _nearestRailwayStation = nearestRailwayStation;
    _status = status;
    _passport = passport;
    _cdc = cdc;
    _indos = indos;
    _coc = coc;
    _copWatchKeeping = copWatchKeeping;
    _efaMfaMedicare = efaMfaMedicare;
    _pstPscrb = pstPscrb;
    _fpffAff = fpffAff;
    _pssr = pssr;
    _ssoStsdsd = ssoStsdsd;
    _goc = goc;
    _gmdssEndorsement = gmdssEndorsement;
    _sid = sid;
    _yellowFever = yellowFever;
    _roc = roc;
    _arpa = arpa;
    _ransco = ransco;
    _btm = btm;
    _brm = brm;
    _ecdis = ecdis;
    _ers = ers;
    _highVoltage = highVoltage;
    _covid19Vac = covid19Vac;
    _fcmToken = fcmToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
    _otp = json['otp'];
    _otpExpiredAt = json['otp_expired_at'];
    _emailOtp = json['email_otp'];
    _dob = json['dob'];
    _indosNumber = json['indos_number'];
    _passportNumber = json['passport_number'];
    _qualification = json['qualification'];
    _profilePhoto = json['profile_photo'];
    _bloodGroup = json['blood_group'];
    _pan = json['pan'];
    _resume = json['resume'];
    _uniformSize = json['uniform_size'];
    _footSize = json['foot_size'];
    _availableFrom = json['available_from'];
    _availableTo = json['available_to'];
    _preferredContract = json['preferred_contract'];
    _preferredSailingArea = json['preferred_sailing_area'];
    _kinName = json['kin_name'];
    _kinRelation = json['kin_relation'];
    _kinPhone = json['kin_phone'];
    _kinUpload = json['kin_upload'];
    _city = json['city'];
    _state = json['state'];
    _nearestAirport = json['nearest_airport'];
    _nearestRailwayStation = json['nearest_railway_station'];
    _status = json['status'];
    _passport = json['passport'];
    _cdc = json['cdc'];
    _indos = json['indos'];
    _coc = json['coc'];
    _copWatchKeeping = json['cop_watch_keeping'];
    _efaMfaMedicare = json['efa_mfa_medicare'];
    _pstPscrb = json['pst_pscrb'];
    _fpffAff = json['fpff_aff'];
    _pssr = json['pssr'];
    _ssoStsdsd = json['sso_stsdsd'];
    _goc = json['goc'];
    _gmdssEndorsement = json['gmdss_endorsement'];
    _sid = json['sid'];
    _yellowFever = json['yellow_fever'];
    _roc = json['roc'];
    _arpa = json['arpa'];
    _ransco = json['ransco'];
    _btm = json['btm'];
    _brm = json['brm'];
    _ecdis = json['ecdis'];
    _ers = json['ers'];
    _highVoltage = json['high_voltage'];
    _covid19Vac = json['covid_19_vac'];
    _fcmToken = json['fcm_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _phone;
  dynamic _otp;
  dynamic _otpExpiredAt;
  dynamic _emailOtp;
  String? _dob;
  String? _indosNumber;
  String? _passportNumber;
  dynamic _qualification;
  dynamic _profilePhoto;
  String? _bloodGroup;
  String? _pan;
  dynamic _resume;
  String? _uniformSize;
  String? _footSize;
  String? _availableFrom;
  String? _availableTo;
  dynamic _preferredContract;
  dynamic _preferredSailingArea;
  dynamic _kinName;
  dynamic _kinRelation;
  dynamic _kinPhone;
  dynamic _kinUpload;
  dynamic _city;
  dynamic _state;
  dynamic _nearestAirport;
  dynamic _nearestRailwayStation;
  num? _status;
  String? _passport;
  dynamic _cdc;
  dynamic _indos;
  dynamic _coc;
  dynamic _copWatchKeeping;
  dynamic _efaMfaMedicare;
  dynamic _pstPscrb;
  dynamic _fpffAff;
  dynamic _pssr;
  dynamic _ssoStsdsd;
  dynamic _goc;
  dynamic _gmdssEndorsement;
  dynamic _sid;
  dynamic _yellowFever;
  dynamic _roc;
  dynamic _arpa;
  dynamic _ransco;
  dynamic _btm;
  dynamic _brm;
  dynamic _ecdis;
  dynamic _ers;
  dynamic _highVoltage;
  dynamic _covid19Vac;
  dynamic _fcmToken;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? phone,
  dynamic otp,
  dynamic otpExpiredAt,
  dynamic emailOtp,
  String? dob,
  String? indosNumber,
  String? passportNumber,
  dynamic qualification,
  dynamic profilePhoto,
  String? bloodGroup,
  String? pan,
  dynamic resume,
  String? uniformSize,
  String? footSize,
  String? availableFrom,
  String? availableTo,
  dynamic preferredContract,
  dynamic preferredSailingArea,
  dynamic kinName,
  dynamic kinRelation,
  dynamic kinPhone,
  dynamic kinUpload,
  dynamic city,
  dynamic state,
  dynamic nearestAirport,
  dynamic nearestRailwayStation,
  num? status,
  String? passport,
  dynamic cdc,
  dynamic indos,
  dynamic coc,
  dynamic copWatchKeeping,
  dynamic efaMfaMedicare,
  dynamic pstPscrb,
  dynamic fpffAff,
  dynamic pssr,
  dynamic ssoStsdsd,
  dynamic goc,
  dynamic gmdssEndorsement,
  dynamic sid,
  dynamic yellowFever,
  dynamic roc,
  dynamic arpa,
  dynamic ransco,
  dynamic btm,
  dynamic brm,
  dynamic ecdis,
  dynamic ers,
  dynamic highVoltage,
  dynamic covid19Vac,
  dynamic fcmToken,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  phone: phone ?? _phone,
  otp: otp ?? _otp,
  otpExpiredAt: otpExpiredAt ?? _otpExpiredAt,
  emailOtp: emailOtp ?? _emailOtp,
  dob: dob ?? _dob,
  indosNumber: indosNumber ?? _indosNumber,
  passportNumber: passportNumber ?? _passportNumber,
  qualification: qualification ?? _qualification,
  profilePhoto: profilePhoto ?? _profilePhoto,
  bloodGroup: bloodGroup ?? _bloodGroup,
  pan: pan ?? _pan,
  resume: resume ?? _resume,
  uniformSize: uniformSize ?? _uniformSize,
  footSize: footSize ?? _footSize,
  availableFrom: availableFrom ?? _availableFrom,
  availableTo: availableTo ?? _availableTo,
  preferredContract: preferredContract ?? _preferredContract,
  preferredSailingArea: preferredSailingArea ?? _preferredSailingArea,
  kinName: kinName ?? _kinName,
  kinRelation: kinRelation ?? _kinRelation,
  kinPhone: kinPhone ?? _kinPhone,
  kinUpload: kinUpload ?? _kinUpload,
  city: city ?? _city,
  state: state ?? _state,
  nearestAirport: nearestAirport ?? _nearestAirport,
  nearestRailwayStation: nearestRailwayStation ?? _nearestRailwayStation,
  status: status ?? _status,
  passport: passport ?? _passport,
  cdc: cdc ?? _cdc,
  indos: indos ?? _indos,
  coc: coc ?? _coc,
  copWatchKeeping: copWatchKeeping ?? _copWatchKeeping,
  efaMfaMedicare: efaMfaMedicare ?? _efaMfaMedicare,
  pstPscrb: pstPscrb ?? _pstPscrb,
  fpffAff: fpffAff ?? _fpffAff,
  pssr: pssr ?? _pssr,
  ssoStsdsd: ssoStsdsd ?? _ssoStsdsd,
  goc: goc ?? _goc,
  gmdssEndorsement: gmdssEndorsement ?? _gmdssEndorsement,
  sid: sid ?? _sid,
  yellowFever: yellowFever ?? _yellowFever,
  roc: roc ?? _roc,
  arpa: arpa ?? _arpa,
  ransco: ransco ?? _ransco,
  btm: btm ?? _btm,
  brm: brm ?? _brm,
  ecdis: ecdis ?? _ecdis,
  ers: ers ?? _ers,
  highVoltage: highVoltage ?? _highVoltage,
  covid19Vac: covid19Vac ?? _covid19Vac,
  fcmToken: fcmToken ?? _fcmToken,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get phone => _phone;
  dynamic get otp => _otp;
  dynamic get otpExpiredAt => _otpExpiredAt;
  dynamic get emailOtp => _emailOtp;
  String? get dob => _dob;
  String? get indosNumber => _indosNumber;
  String? get passportNumber => _passportNumber;
  dynamic get qualification => _qualification;
  dynamic get profilePhoto => _profilePhoto;
  String? get bloodGroup => _bloodGroup;
  String? get pan => _pan;
  dynamic get resume => _resume;
  String? get uniformSize => _uniformSize;
  String? get footSize => _footSize;
  String? get availableFrom => _availableFrom;
  String? get availableTo => _availableTo;
  dynamic get preferredContract => _preferredContract;
  dynamic get preferredSailingArea => _preferredSailingArea;
  dynamic get kinName => _kinName;
  dynamic get kinRelation => _kinRelation;
  dynamic get kinPhone => _kinPhone;
  dynamic get kinUpload => _kinUpload;
  dynamic get city => _city;
  dynamic get state => _state;
  dynamic get nearestAirport => _nearestAirport;
  dynamic get nearestRailwayStation => _nearestRailwayStation;
  num? get status => _status;
  String? get passport => _passport;
  dynamic get cdc => _cdc;
  dynamic get indos => _indos;
  dynamic get coc => _coc;
  dynamic get copWatchKeeping => _copWatchKeeping;
  dynamic get efaMfaMedicare => _efaMfaMedicare;
  dynamic get pstPscrb => _pstPscrb;
  dynamic get fpffAff => _fpffAff;
  dynamic get pssr => _pssr;
  dynamic get ssoStsdsd => _ssoStsdsd;
  dynamic get goc => _goc;
  dynamic get gmdssEndorsement => _gmdssEndorsement;
  dynamic get sid => _sid;
  dynamic get yellowFever => _yellowFever;
  dynamic get roc => _roc;
  dynamic get arpa => _arpa;
  dynamic get ransco => _ransco;
  dynamic get btm => _btm;
  dynamic get brm => _brm;
  dynamic get ecdis => _ecdis;
  dynamic get ers => _ers;
  dynamic get highVoltage => _highVoltage;
  dynamic get covid19Vac => _covid19Vac;
  dynamic get fcmToken => _fcmToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
    map['otp'] = _otp;
    map['otp_expired_at'] = _otpExpiredAt;
    map['email_otp'] = _emailOtp;
    map['dob'] = _dob;
    map['indos_number'] = _indosNumber;
    map['passport_number'] = _passportNumber;
    map['qualification'] = _qualification;
    map['profile_photo'] = _profilePhoto;
    map['blood_group'] = _bloodGroup;
    map['pan'] = _pan;
    map['resume'] = _resume;
    map['uniform_size'] = _uniformSize;
    map['foot_size'] = _footSize;
    map['available_from'] = _availableFrom;
    map['available_to'] = _availableTo;
    map['preferred_contract'] = _preferredContract;
    map['preferred_sailing_area'] = _preferredSailingArea;
    map['kin_name'] = _kinName;
    map['kin_relation'] = _kinRelation;
    map['kin_phone'] = _kinPhone;
    map['kin_upload'] = _kinUpload;
    map['city'] = _city;
    map['state'] = _state;
    map['nearest_airport'] = _nearestAirport;
    map['nearest_railway_station'] = _nearestRailwayStation;
    map['status'] = _status;
    map['passport'] = _passport;
    map['cdc'] = _cdc;
    map['indos'] = _indos;
    map['coc'] = _coc;
    map['cop_watch_keeping'] = _copWatchKeeping;
    map['efa_mfa_medicare'] = _efaMfaMedicare;
    map['pst_pscrb'] = _pstPscrb;
    map['fpff_aff'] = _fpffAff;
    map['pssr'] = _pssr;
    map['sso_stsdsd'] = _ssoStsdsd;
    map['goc'] = _goc;
    map['gmdss_endorsement'] = _gmdssEndorsement;
    map['sid'] = _sid;
    map['yellow_fever'] = _yellowFever;
    map['roc'] = _roc;
    map['arpa'] = _arpa;
    map['ransco'] = _ransco;
    map['btm'] = _btm;
    map['brm'] = _brm;
    map['ecdis'] = _ecdis;
    map['ers'] = _ers;
    map['high_voltage'] = _highVoltage;
    map['covid_19_vac'] = _covid19Vac;
    map['fcm_token'] = _fcmToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 5
/// job_id : "APJS-20247705"
/// title : "Test"
/// job_type : "Full-time"
/// position : "Crew"
/// description : "Test"
/// eligibility : "Test"
/// travel_details : "Test"
/// service_type : "In Office"
/// duration : null
/// duration_year : 2
/// duration_month : 6
/// duration_day : 5
/// last_apply_date : "19/02/2024"
/// vancancy : 10
/// salary_range : "3000 - 22000"
/// created_at : "2024-01-04T04:37:43.000000Z"
/// updated_at : "2024-01-29T06:40:37.000000Z"

class Job {
  Job({
      num? id, 
      String? jobId, 
      String? title, 
      String? jobType, 
      String? position, 
      String? description, 
      String? eligibility, 
      String? travelDetails, 
      String? serviceType, 
      dynamic duration, 
      num? durationYear, 
      num? durationMonth, 
      num? durationDay, 
      String? lastApplyDate, 
      num? vancancy, 
      String? salaryRange, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _jobId = jobId;
    _title = title;
    _jobType = jobType;
    _position = position;
    _description = description;
    _eligibility = eligibility;
    _travelDetails = travelDetails;
    _serviceType = serviceType;
    _duration = duration;
    _durationYear = durationYear;
    _durationMonth = durationMonth;
    _durationDay = durationDay;
    _lastApplyDate = lastApplyDate;
    _vancancy = vancancy;
    _salaryRange = salaryRange;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Job.fromJson(dynamic json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _title = json['title'];
    _jobType = json['job_type'];
    _position = json['position'];
    _description = json['description'];
    _eligibility = json['eligibility'];
    _travelDetails = json['travel_details'];
    _serviceType = json['service_type'];
    _duration = json['duration'];
    _durationYear = json['duration_year'];
    _durationMonth = json['duration_month'];
    _durationDay = json['duration_day'];
    _lastApplyDate = json['last_apply_date'];
    _vancancy = json['vancancy'];
    _salaryRange = json['salary_range'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _jobId;
  String? _title;
  String? _jobType;
  String? _position;
  String? _description;
  String? _eligibility;
  String? _travelDetails;
  String? _serviceType;
  dynamic _duration;
  num? _durationYear;
  num? _durationMonth;
  num? _durationDay;
  String? _lastApplyDate;
  num? _vancancy;
  String? _salaryRange;
  String? _createdAt;
  String? _updatedAt;
Job copyWith({  num? id,
  String? jobId,
  String? title,
  String? jobType,
  String? position,
  String? description,
  String? eligibility,
  String? travelDetails,
  String? serviceType,
  dynamic duration,
  num? durationYear,
  num? durationMonth,
  num? durationDay,
  String? lastApplyDate,
  num? vancancy,
  String? salaryRange,
  String? createdAt,
  String? updatedAt,
}) => Job(  id: id ?? _id,
  jobId: jobId ?? _jobId,
  title: title ?? _title,
  jobType: jobType ?? _jobType,
  position: position ?? _position,
  description: description ?? _description,
  eligibility: eligibility ?? _eligibility,
  travelDetails: travelDetails ?? _travelDetails,
  serviceType: serviceType ?? _serviceType,
  duration: duration ?? _duration,
  durationYear: durationYear ?? _durationYear,
  durationMonth: durationMonth ?? _durationMonth,
  durationDay: durationDay ?? _durationDay,
  lastApplyDate: lastApplyDate ?? _lastApplyDate,
  vancancy: vancancy ?? _vancancy,
  salaryRange: salaryRange ?? _salaryRange,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get jobId => _jobId;
  String? get title => _title;
  String? get jobType => _jobType;
  String? get position => _position;
  String? get description => _description;
  String? get eligibility => _eligibility;
  String? get travelDetails => _travelDetails;
  String? get serviceType => _serviceType;
  dynamic get duration => _duration;
  num? get durationYear => _durationYear;
  num? get durationMonth => _durationMonth;
  num? get durationDay => _durationDay;
  String? get lastApplyDate => _lastApplyDate;
  num? get vancancy => _vancancy;
  String? get salaryRange => _salaryRange;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['job_id'] = _jobId;
    map['title'] = _title;
    map['job_type'] = _jobType;
    map['position'] = _position;
    map['description'] = _description;
    map['eligibility'] = _eligibility;
    map['travel_details'] = _travelDetails;
    map['service_type'] = _serviceType;
    map['duration'] = _duration;
    map['duration_year'] = _durationYear;
    map['duration_month'] = _durationMonth;
    map['duration_day'] = _durationDay;
    map['last_apply_date'] = _lastApplyDate;
    map['vancancy'] = _vancancy;
    map['salary_range'] = _salaryRange;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}