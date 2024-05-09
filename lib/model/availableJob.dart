/// status : true
/// message : "Job list."
/// data : {"jobs":[{"id":5,"job_id":"APJS-20247705","title":"Test","job_type":"Full-time","position":"Crew","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":2,"duration_month":6,"duration_day":5,"last_apply_date":"19/02/2024","vancancy":10,"salary_range":"3000 - 22000","created_at":"2024-01-04T04:37:43.000000Z","updated_at":"2024-01-29T06:40:37.000000Z"},{"id":4,"job_id":"APJS-20244903","title":"Test 2","job_type":"Part-time","position":"Crew Member","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":1,"duration_month":5,"duration_day":20,"last_apply_date":"26/02/2024","vancancy":null,"salary_range":"4000 - 28000","created_at":"2024-01-03T14:58:14.000000Z","updated_at":"2024-01-29T06:40:49.000000Z"}]}

class AvailableJob {
  AvailableJob({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  AvailableJob.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
AvailableJob copyWith({  bool? status,
  String? message,
  Data? data,
}) => AvailableJob(  status: status ?? _status,
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

/// jobs : [{"id":5,"job_id":"APJS-20247705","title":"Test","job_type":"Full-time","position":"Crew","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":2,"duration_month":6,"duration_day":5,"last_apply_date":"19/02/2024","vancancy":10,"salary_range":"3000 - 22000","created_at":"2024-01-04T04:37:43.000000Z","updated_at":"2024-01-29T06:40:37.000000Z"},{"id":4,"job_id":"APJS-20244903","title":"Test 2","job_type":"Part-time","position":"Crew Member","description":"Test","eligibility":"Test","travel_details":"Test","service_type":"In Office","duration":null,"duration_year":1,"duration_month":5,"duration_day":20,"last_apply_date":"26/02/2024","vancancy":null,"salary_range":"4000 - 28000","created_at":"2024-01-03T14:58:14.000000Z","updated_at":"2024-01-29T06:40:49.000000Z"}]

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

class Jobs {
  Jobs({
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

  Jobs.fromJson(dynamic json) {
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
Jobs copyWith({  num? id,
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
}) => Jobs(  id: id ?? _id,
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