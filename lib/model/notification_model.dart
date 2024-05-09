/// status : true
/// message : "Notification list."
/// data : {"notifications":[{"id":58,"user_id":1,"is_receiver_admin":0,"title":"New Job Applied","message":"You have successfully applied for the Test","is_read":0,"created_at":"2024-01-29T13:16:43.000000Z","updated_at":"2024-01-29T13:16:43.000000Z"}]}

class NotificationModel {
  NotificationModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  NotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
NotificationModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => NotificationModel(  status: status ?? _status,
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

/// notifications : [{"id":58,"user_id":1,"is_receiver_admin":0,"title":"New Job Applied","message":"You have successfully applied for the Test","is_read":0,"created_at":"2024-01-29T13:16:43.000000Z","updated_at":"2024-01-29T13:16:43.000000Z"}]

class Data {
  Data({
      List<Notifications>? notifications,}){
    _notifications = notifications;
}

  Data.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  List<Notifications>? _notifications;
Data copyWith({  List<Notifications>? notifications,
}) => Data(  notifications: notifications ?? _notifications,
);
  List<Notifications>? get notifications => _notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 58
/// user_id : 1
/// is_receiver_admin : 0
/// title : "New Job Applied"
/// message : "You have successfully applied for the Test"
/// is_read : 0
/// created_at : "2024-01-29T13:16:43.000000Z"
/// updated_at : "2024-01-29T13:16:43.000000Z"

class Notifications {
  Notifications({
      num? id, 
      num? userId, 
      num? isReceiverAdmin, 
      String? title, 
      String? message, 
      num? isRead, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _isReceiverAdmin = isReceiverAdmin;
    _title = title;
    _message = message;
    _isRead = isRead;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Notifications.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _isReceiverAdmin = json['is_receiver_admin'];
    _title = json['title'];
    _message = json['message'];
    _isRead = json['is_read'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  num? _isReceiverAdmin;
  String? _title;
  String? _message;
  num? _isRead;
  String? _createdAt;
  String? _updatedAt;
Notifications copyWith({  num? id,
  num? userId,
  num? isReceiverAdmin,
  String? title,
  String? message,
  num? isRead,
  String? createdAt,
  String? updatedAt,
}) => Notifications(  id: id ?? _id,
  userId: userId ?? _userId,
  isReceiverAdmin: isReceiverAdmin ?? _isReceiverAdmin,
  title: title ?? _title,
  message: message ?? _message,
  isRead: isRead ?? _isRead,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get isReceiverAdmin => _isReceiverAdmin;
  String? get title => _title;
  String? get message => _message;
  num? get isRead => _isRead;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['is_receiver_admin'] = _isReceiverAdmin;
    map['title'] = _title;
    map['message'] = _message;
    map['is_read'] = _isRead;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}