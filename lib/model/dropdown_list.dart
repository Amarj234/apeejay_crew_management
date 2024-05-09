/// status : true
/// message : "Form Dropdown List."
/// data : {"blood_groups":["A+","B+","AB+","O+","O-","A-","B-","AB-"],"job_types":["Full-time","Part-time"],"sailing_areas":["Coastal","Foreign"],"shoe_sizes":["05","06","07","08","09","10","11","12"],"uniform_sizes":["S","M","L","XL"],"relationships":["Father","Mother","Sister","Brother"],"cities":["Chennai","Kolkata","Mumbai","New Delhi"],"states":["Delhi","Maharashtra","Tamil Nadu","West Bengal"],"rank_categories":[{"id":1,"category":"Officer"},{"id":2,"category":"Rating"},{"id":3,"category":"Others"}]}

class DropdownList {
  DropdownList({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DropdownList.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
DropdownList copyWith({  bool? status,
  String? message,
  Data? data,
}) => DropdownList(  status: status ?? _status,
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

/// blood_groups : ["A+","B+","AB+","O+","O-","A-","B-","AB-"]
/// job_types : ["Full-time","Part-time"]
/// sailing_areas : ["Coastal","Foreign"]
/// shoe_sizes : ["05","06","07","08","09","10","11","12"]
/// uniform_sizes : ["S","M","L","XL"]
/// relationships : ["Father","Mother","Sister","Brother"]
/// cities : ["Chennai","Kolkata","Mumbai","New Delhi"]
/// states : ["Delhi","Maharashtra","Tamil Nadu","West Bengal"]
/// rank_categories : [{"id":1,"category":"Officer"},{"id":2,"category":"Rating"},{"id":3,"category":"Others"}]

class Data {
  Data({
      List<String>? bloodGroups, 
      List<String>? jobTypes, 
      List<String>? sailingAreas, 
      List<String>? shoeSizes, 
      List<String>? uniformSizes, 
      List<String>? relationships, 
      List<String>? cities, 
      List<String>? states, 
      List<RankCategories>? rankCategories,}){
    _bloodGroups = bloodGroups;
    _jobTypes = jobTypes;
    _sailingAreas = sailingAreas;
    _shoeSizes = shoeSizes;
    _uniformSizes = uniformSizes;
    _relationships = relationships;
    _cities = cities;
    _states = states;
    _rankCategories = rankCategories;
}

  Data.fromJson(dynamic json) {
    _bloodGroups = json['blood_groups'] != null ? json['blood_groups'].cast<String>() : [];
    _jobTypes = json['job_types'] != null ? json['job_types'].cast<String>() : [];
    _sailingAreas = json['sailing_areas'] != null ? json['sailing_areas'].cast<String>() : [];
    _shoeSizes = json['shoe_sizes'] != null ? json['shoe_sizes'].cast<String>() : [];
    _uniformSizes = json['uniform_sizes'] != null ? json['uniform_sizes'].cast<String>() : [];
    _relationships = json['relationships'] != null ? json['relationships'].cast<String>() : [];
    _cities = json['cities'] != null ? json['cities'].cast<String>() : [];
    _states = json['states'] != null ? json['states'].cast<String>() : [];
    if (json['rank_categories'] != null) {
      _rankCategories = [];
      json['rank_categories'].forEach((v) {
        _rankCategories?.add(RankCategories.fromJson(v));
      });
    }
  }
  List<String>? _bloodGroups;
  List<String>? _jobTypes;
  List<String>? _sailingAreas;
  List<String>? _shoeSizes;
  List<String>? _uniformSizes;
  List<String>? _relationships;
  List<String>? _cities;
  List<String>? _states;
  List<RankCategories>? _rankCategories;
Data copyWith({  List<String>? bloodGroups,
  List<String>? jobTypes,
  List<String>? sailingAreas,
  List<String>? shoeSizes,
  List<String>? uniformSizes,
  List<String>? relationships,
  List<String>? cities,
  List<String>? states,
  List<RankCategories>? rankCategories,
}) => Data(  bloodGroups: bloodGroups ?? _bloodGroups,
  jobTypes: jobTypes ?? _jobTypes,
  sailingAreas: sailingAreas ?? _sailingAreas,
  shoeSizes: shoeSizes ?? _shoeSizes,
  uniformSizes: uniformSizes ?? _uniformSizes,
  relationships: relationships ?? _relationships,
  cities: cities ?? _cities,
  states: states ?? _states,
  rankCategories: rankCategories ?? _rankCategories,
);
  List<String>? get bloodGroups => _bloodGroups;
  List<String>? get jobTypes => _jobTypes;
  List<String>? get sailingAreas => _sailingAreas;
  List<String>? get shoeSizes => _shoeSizes;
  List<String>? get uniformSizes => _uniformSizes;
  List<String>? get relationships => _relationships;
  List<String>? get cities => _cities;
  List<String>? get states => _states;
  List<RankCategories>? get rankCategories => _rankCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['blood_groups'] = _bloodGroups;
    map['job_types'] = _jobTypes;
    map['sailing_areas'] = _sailingAreas;
    map['shoe_sizes'] = _shoeSizes;
    map['uniform_sizes'] = _uniformSizes;
    map['relationships'] = _relationships;
    map['cities'] = _cities;
    map['states'] = _states;
    if (_rankCategories != null) {
      map['rank_categories'] = _rankCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// category : "Officer"

class RankCategories {
  RankCategories({
      num? id, 
      String? category,}){
    _id = id;
    _category = category;
}

  RankCategories.fromJson(dynamic json) {
    _id = json['id'];
    _category = json['category'];
  }
  num? _id;
  String? _category;
RankCategories copyWith({  num? id,
  String? category,
}) => RankCategories(  id: id ?? _id,
  category: category ?? _category,
);
  num? get id => _id;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category'] = _category;
    return map;
  }

}