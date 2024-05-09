/// status : true
/// message : "Notification count."
/// data : {"notification_count":1}

class CountNotification {
  CountNotification({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CountNotification.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
CountNotification copyWith({  bool? status,
  String? message,
  Data? data,
}) => CountNotification(  status: status ?? _status,
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

/// notification_count : 1

class Data {
  Data({
      num? notificationCount,}){
    _notificationCount = notificationCount;
}

  Data.fromJson(dynamic json) {
    _notificationCount = json['notification_count'];
  }
  num? _notificationCount;
Data copyWith({  num? notificationCount,
}) => Data(  notificationCount: notificationCount ?? _notificationCount,
);
  num? get notificationCount => _notificationCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification_count'] = _notificationCount;
    return map;
  }

}