/// status : true
/// message : "CMS details."
/// data : {"image_base_url":"http://15.206.182.76/apeejay-crew-app/public/images","details":{"id":1,"splash_background":null,"logo":"1706109405.png","intro_1_heading":"Your Gatewayto Exciting Maritime Careers","intro_1_description":"Unlock seamless access to maritime careers. Register easily, apply for exciting positions, and stay connected with Apeejay Shipping. Apeejay Shipping Limited, an Apeejay Surrendra Group Company, a leading name in the maritime industry is the third largest privately owned company in India, is celebrating of its 75th anniversary since its inception on 25th August 1948","intro_2_heading":"Effortless Job Applications, Direct Communication","intro_2_description":"Navigate your career path effortlessly with Apeejay Shipping. Our Crew Management App is your direct link to exciting job opportunities in the maritime industry.","intro_1_background":null,"intro_2_background":null,"register_background":null,"verify_phone_background":null,"profile_form_background":null,"availability_form_background":null,"terms_conditions":null,"privacy_policy":null,"created_at":"2024-01-24T10:58:36.000000Z","updated_at":"2024-01-24T15:18:58.000000Z"}}

class SplaceText {
  SplaceText({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SplaceText.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
SplaceText copyWith({  bool? status,
  String? message,
  Data? data,
}) => SplaceText(  status: status ?? _status,
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

/// image_base_url : "http://15.206.182.76/apeejay-crew-app/public/images"
/// details : {"id":1,"splash_background":null,"logo":"1706109405.png","intro_1_heading":"Your Gatewayto Exciting Maritime Careers","intro_1_description":"Unlock seamless access to maritime careers. Register easily, apply for exciting positions, and stay connected with Apeejay Shipping. Apeejay Shipping Limited, an Apeejay Surrendra Group Company, a leading name in the maritime industry is the third largest privately owned company in India, is celebrating of its 75th anniversary since its inception on 25th August 1948","intro_2_heading":"Effortless Job Applications, Direct Communication","intro_2_description":"Navigate your career path effortlessly with Apeejay Shipping. Our Crew Management App is your direct link to exciting job opportunities in the maritime industry.","intro_1_background":null,"intro_2_background":null,"register_background":null,"verify_phone_background":null,"profile_form_background":null,"availability_form_background":null,"terms_conditions":null,"privacy_policy":null,"created_at":"2024-01-24T10:58:36.000000Z","updated_at":"2024-01-24T15:18:58.000000Z"}

class Data {
  Data({
      String? imageBaseUrl, 
      Details? details,}){
    _imageBaseUrl = imageBaseUrl;
    _details = details;
}

  Data.fromJson(dynamic json) {
    _imageBaseUrl = json['image_base_url'];
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? _imageBaseUrl;
  Details? _details;
Data copyWith({  String? imageBaseUrl,
  Details? details,
}) => Data(  imageBaseUrl: imageBaseUrl ?? _imageBaseUrl,
  details: details ?? _details,
);
  String? get imageBaseUrl => _imageBaseUrl;
  Details? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_base_url'] = _imageBaseUrl;
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    return map;
  }

}

/// id : 1
/// splash_background : null
/// logo : "1706109405.png"
/// intro_1_heading : "Your Gatewayto Exciting Maritime Careers"
/// intro_1_description : "Unlock seamless access to maritime careers. Register easily, apply for exciting positions, and stay connected with Apeejay Shipping. Apeejay Shipping Limited, an Apeejay Surrendra Group Company, a leading name in the maritime industry is the third largest privately owned company in India, is celebrating of its 75th anniversary since its inception on 25th August 1948"
/// intro_2_heading : "Effortless Job Applications, Direct Communication"
/// intro_2_description : "Navigate your career path effortlessly with Apeejay Shipping. Our Crew Management App is your direct link to exciting job opportunities in the maritime industry."
/// intro_1_background : null
/// intro_2_background : null
/// register_background : null
/// verify_phone_background : null
/// profile_form_background : null
/// availability_form_background : null
/// terms_conditions : null
/// privacy_policy : null
/// created_at : "2024-01-24T10:58:36.000000Z"
/// updated_at : "2024-01-24T15:18:58.000000Z"

class Details {
  Details({
      num? id, 
      dynamic splashBackground, 
      String? logo, 
      String? intro1Heading, 
      String? intro1Description, 
      String? intro2Heading, 
      String? intro2Description, 
      dynamic intro1Background, 
      dynamic intro2Background, 
      dynamic registerBackground, 
      dynamic verifyPhoneBackground, 
      dynamic profileFormBackground, 
      dynamic availabilityFormBackground, 
      dynamic termsConditions, 
      dynamic privacyPolicy, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _splashBackground = splashBackground;
    _logo = logo;
    _intro1Heading = intro1Heading;
    _intro1Description = intro1Description;
    _intro2Heading = intro2Heading;
    _intro2Description = intro2Description;
    _intro1Background = intro1Background;
    _intro2Background = intro2Background;
    _registerBackground = registerBackground;
    _verifyPhoneBackground = verifyPhoneBackground;
    _profileFormBackground = profileFormBackground;
    _availabilityFormBackground = availabilityFormBackground;
    _termsConditions = termsConditions;
    _privacyPolicy = privacyPolicy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _splashBackground = json['splash_background'];
    _logo = json['logo'];
    _intro1Heading = json['intro_1_heading'];
    _intro1Description = json['intro_1_description'];
    _intro2Heading = json['intro_2_heading'];
    _intro2Description = json['intro_2_description'];
    _intro1Background = json['intro_1_background'];
    _intro2Background = json['intro_2_background'];
    _registerBackground = json['register_background'];
    _verifyPhoneBackground = json['verify_phone_background'];
    _profileFormBackground = json['profile_form_background'];
    _availabilityFormBackground = json['availability_form_background'];
    _termsConditions = json['terms_conditions'];
    _privacyPolicy = json['privacy_policy'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  dynamic _splashBackground;
  String? _logo;
  String? _intro1Heading;
  String? _intro1Description;
  String? _intro2Heading;
  String? _intro2Description;
  dynamic _intro1Background;
  dynamic _intro2Background;
  dynamic _registerBackground;
  dynamic _verifyPhoneBackground;
  dynamic _profileFormBackground;
  dynamic _availabilityFormBackground;
  dynamic _termsConditions;
  dynamic _privacyPolicy;
  String? _createdAt;
  String? _updatedAt;
Details copyWith({  num? id,
  dynamic splashBackground,
  String? logo,
  String? intro1Heading,
  String? intro1Description,
  String? intro2Heading,
  String? intro2Description,
  dynamic intro1Background,
  dynamic intro2Background,
  dynamic registerBackground,
  dynamic verifyPhoneBackground,
  dynamic profileFormBackground,
  dynamic availabilityFormBackground,
  dynamic termsConditions,
  dynamic privacyPolicy,
  String? createdAt,
  String? updatedAt,
}) => Details(  id: id ?? _id,
  splashBackground: splashBackground ?? _splashBackground,
  logo: logo ?? _logo,
  intro1Heading: intro1Heading ?? _intro1Heading,
  intro1Description: intro1Description ?? _intro1Description,
  intro2Heading: intro2Heading ?? _intro2Heading,
  intro2Description: intro2Description ?? _intro2Description,
  intro1Background: intro1Background ?? _intro1Background,
  intro2Background: intro2Background ?? _intro2Background,
  registerBackground: registerBackground ?? _registerBackground,
  verifyPhoneBackground: verifyPhoneBackground ?? _verifyPhoneBackground,
  profileFormBackground: profileFormBackground ?? _profileFormBackground,
  availabilityFormBackground: availabilityFormBackground ?? _availabilityFormBackground,
  termsConditions: termsConditions ?? _termsConditions,
  privacyPolicy: privacyPolicy ?? _privacyPolicy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  dynamic get splashBackground => _splashBackground;
  String? get logo => _logo;
  String? get intro1Heading => _intro1Heading;
  String? get intro1Description => _intro1Description;
  String? get intro2Heading => _intro2Heading;
  String? get intro2Description => _intro2Description;
  dynamic get intro1Background => _intro1Background;
  dynamic get intro2Background => _intro2Background;
  dynamic get registerBackground => _registerBackground;
  dynamic get verifyPhoneBackground => _verifyPhoneBackground;
  dynamic get profileFormBackground => _profileFormBackground;
  dynamic get availabilityFormBackground => _availabilityFormBackground;
  dynamic get termsConditions => _termsConditions;
  dynamic get privacyPolicy => _privacyPolicy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['splash_background'] = _splashBackground;
    map['logo'] = _logo;
    map['intro_1_heading'] = _intro1Heading;
    map['intro_1_description'] = _intro1Description;
    map['intro_2_heading'] = _intro2Heading;
    map['intro_2_description'] = _intro2Description;
    map['intro_1_background'] = _intro1Background;
    map['intro_2_background'] = _intro2Background;
    map['register_background'] = _registerBackground;
    map['verify_phone_background'] = _verifyPhoneBackground;
    map['profile_form_background'] = _profileFormBackground;
    map['availability_form_background'] = _availabilityFormBackground;
    map['terms_conditions'] = _termsConditions;
    map['privacy_policy'] = _privacyPolicy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}