/// status : true
/// message : "User details."
/// data : {"profile_photo_base_url":"http://15.206.182.76/apeejay-crew-app/public/crew/picture","resume_base_url":"http://15.206.182.76/apeejay-crew-app/public/crew/resume","document_base_url":"http://15.206.182.76/apeejay-crew-app/public/crew/document","details":{"id":79,"name":"RAJAN KENNETH RAJAN","email":"amarj234@gmail.com","email_verified_at":null,"phone":"1234567890","dob":"1971-11-10","indos_number":"99NL1171","passport_number":"Z6044260","qualification":null,"profile_photo":"1708415933.jpg","blood_group":"AB+","pan":"JKHKJIHU","resume":"1707885096.pdf","uniform_size":null,"foot_size":null,"available_from":null,"available_to":null,"preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"passport":null,"cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"status":1,"is_fully_register":1,"rank_id":19,"created_at":"2024-02-14T04:28:07.000000Z","updated_at":"2024-02-23T09:37:27.000000Z","rank":"Oiler","category_id":2,"category":"Rating"}}

class UserDetails {
  UserDetails({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UserDetails.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
UserDetails copyWith({  bool? status,
  String? message,
  Data? data,
}) => UserDetails(  status: status ?? _status,
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

/// profile_photo_base_url : "http://15.206.182.76/apeejay-crew-app/public/crew/picture"
/// resume_base_url : "http://15.206.182.76/apeejay-crew-app/public/crew/resume"
/// document_base_url : "http://15.206.182.76/apeejay-crew-app/public/crew/document"
/// details : {"id":79,"name":"RAJAN KENNETH RAJAN","email":"amarj234@gmail.com","email_verified_at":null,"phone":"1234567890","dob":"1971-11-10","indos_number":"99NL1171","passport_number":"Z6044260","qualification":null,"profile_photo":"1708415933.jpg","blood_group":"AB+","pan":"JKHKJIHU","resume":"1707885096.pdf","uniform_size":null,"foot_size":null,"available_from":null,"available_to":null,"preferred_contract":null,"preferred_sailing_area":null,"kin_name":null,"kin_relation":null,"kin_phone":null,"kin_upload":null,"city":null,"state":null,"nearest_airport":null,"nearest_railway_station":null,"passport":null,"cdc":null,"indos":null,"coc":null,"cop_watch_keeping":null,"efa_mfa_medicare":null,"pst_pscrb":null,"fpff_aff":null,"pssr":null,"sso_stsdsd":null,"goc":null,"gmdss_endorsement":null,"sid":null,"yellow_fever":null,"roc":null,"arpa":null,"ransco":null,"btm":null,"brm":null,"ecdis":null,"ers":null,"high_voltage":null,"covid_19_vac":null,"status":1,"is_fully_register":1,"rank_id":19,"created_at":"2024-02-14T04:28:07.000000Z","updated_at":"2024-02-23T09:37:27.000000Z","rank":"Oiler","category_id":2,"category":"Rating"}

class Data {
  Data({
      String? profilePhotoBaseUrl, 
      String? resumeBaseUrl, 
      String? documentBaseUrl, 
      Details? details,}){
    _profilePhotoBaseUrl = profilePhotoBaseUrl;
    _resumeBaseUrl = resumeBaseUrl;
    _documentBaseUrl = documentBaseUrl;
    _details = details;
}

  Data.fromJson(dynamic json) {
    _profilePhotoBaseUrl = json['profile_photo_base_url'];
    _resumeBaseUrl = json['resume_base_url'];
    _documentBaseUrl = json['document_base_url'];
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? _profilePhotoBaseUrl;
  String? _resumeBaseUrl;
  String? _documentBaseUrl;
  Details? _details;
Data copyWith({  String? profilePhotoBaseUrl,
  String? resumeBaseUrl,
  String? documentBaseUrl,
  Details? details,
}) => Data(  profilePhotoBaseUrl: profilePhotoBaseUrl ?? _profilePhotoBaseUrl,
  resumeBaseUrl: resumeBaseUrl ?? _resumeBaseUrl,
  documentBaseUrl: documentBaseUrl ?? _documentBaseUrl,
  details: details ?? _details,
);
  String? get profilePhotoBaseUrl => _profilePhotoBaseUrl;
  String? get resumeBaseUrl => _resumeBaseUrl;
  String? get documentBaseUrl => _documentBaseUrl;
  Details? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_photo_base_url'] = _profilePhotoBaseUrl;
    map['resume_base_url'] = _resumeBaseUrl;
    map['document_base_url'] = _documentBaseUrl;
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    return map;
  }

}

/// id : 79
/// name : "RAJAN KENNETH RAJAN"
/// email : "amarj234@gmail.com"
/// email_verified_at : null
/// phone : "1234567890"
/// dob : "1971-11-10"
/// indos_number : "99NL1171"
/// passport_number : "Z6044260"
/// qualification : null
/// profile_photo : "1708415933.jpg"
/// blood_group : "AB+"
/// pan : "JKHKJIHU"
/// resume : "1707885096.pdf"
/// uniform_size : null
/// foot_size : null
/// available_from : null
/// available_to : null
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
/// passport : null
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
/// status : 1
/// is_fully_register : 1
/// rank_id : 19
/// created_at : "2024-02-14T04:28:07.000000Z"
/// updated_at : "2024-02-23T09:37:27.000000Z"
/// rank : "Oiler"
/// category_id : 2
/// category : "Rating"

class Details {
  Details({
      num? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? phone, 
      String? dob, 
      String? indosNumber, 
      String? passportNumber, 
      dynamic qualification, 
      String? profilePhoto, 
      String? bloodGroup, 
      String? pan, 
      String? resume, 
      dynamic uniformSize, 
      dynamic footSize, 
      dynamic availableFrom, 
      dynamic availableTo, 
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
      dynamic passport, 
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
      num? status, 
      num? isFullyRegister, 
      num? rankId, 
      String? createdAt, 
      String? updatedAt, 
      String? rank, 
      num? categoryId, 
      String? category,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
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
    _status = status;
    _isFullyRegister = isFullyRegister;
    _rankId = rankId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _rank = rank;
    _categoryId = categoryId;
    _category = category;
}

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
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
    _status = json['status'];
    _isFullyRegister = json['is_fully_register'];
    _rankId = json['rank_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _rank = json['rank'];
    _categoryId = json['category_id'];
    _category = json['category'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _phone;
  String? _dob;
  String? _indosNumber;
  String? _passportNumber;
  dynamic _qualification;
  String? _profilePhoto;
  String? _bloodGroup;
  String? _pan;
  String? _resume;
  dynamic _uniformSize;
  dynamic _footSize;
  dynamic _availableFrom;
  dynamic _availableTo;
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
  dynamic _passport;
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
  num? _status;
  num? _isFullyRegister;
  num? _rankId;
  String? _createdAt;
  String? _updatedAt;
  String? _rank;
  num? _categoryId;
  String? _category;
Details copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? phone,
  String? dob,
  String? indosNumber,
  String? passportNumber,
  dynamic qualification,
  String? profilePhoto,
  String? bloodGroup,
  String? pan,
  String? resume,
  dynamic uniformSize,
  dynamic footSize,
  dynamic availableFrom,
  dynamic availableTo,
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
  dynamic passport,
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
  num? status,
  num? isFullyRegister,
  num? rankId,
  String? createdAt,
  String? updatedAt,
  String? rank,
  num? categoryId,
  String? category,
}) => Details(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  phone: phone ?? _phone,
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
  status: status ?? _status,
  isFullyRegister: isFullyRegister ?? _isFullyRegister,
  rankId: rankId ?? _rankId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  rank: rank ?? _rank,
  categoryId: categoryId ?? _categoryId,
  category: category ?? _category,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get phone => _phone;
  String? get dob => _dob;
  String? get indosNumber => _indosNumber;
  String? get passportNumber => _passportNumber;
  dynamic get qualification => _qualification;
  String? get profilePhoto => _profilePhoto;
  String? get bloodGroup => _bloodGroup;
  String? get pan => _pan;
  String? get resume => _resume;
  dynamic get uniformSize => _uniformSize;
  dynamic get footSize => _footSize;
  dynamic get availableFrom => _availableFrom;
  dynamic get availableTo => _availableTo;
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
  dynamic get passport => _passport;
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
  num? get status => _status;
  num? get isFullyRegister => _isFullyRegister;
  num? get rankId => _rankId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get rank => _rank;
  num? get categoryId => _categoryId;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
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
    map['status'] = _status;
    map['is_fully_register'] = _isFullyRegister;
    map['rank_id'] = _rankId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rank'] = _rank;
    map['category_id'] = _categoryId;
    map['category'] = _category;
    return map;
  }

}