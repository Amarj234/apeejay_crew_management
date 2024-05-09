/// status : true
/// message : "Announcement list."
/// data : {"announcements":[{"id":1,"title":"The Maritime Safety Committee","description":"The Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996.\r\n\r\n- to familiarize passengers with their assembly stations\r\n- to familiarize passengers with their life-saving equipment\r\n- to familiarize passengers with emergency procedures\r\n- all passengers must attend this drill. 1.2.1General emergency alarm\r\n\r\nI have pleasure in informing you that all safety equipment is in full working order. The bow/stern doors are closed and secure. The ship is in all respects ready for sea. Please listen carefully to the safety instructions which follow. In the unlikely event of an emergency, please obey the orders given on the public address system.\r\n\r\nThe Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996.","broadcast_date":"2024-01-23 15:59:34","status":1,"created_at":"2024-01-17T07:57:31.000000Z","updated_at":"2024-01-23T15:59:34.000000Z"}]}

class AnnouncementsModel {
  AnnouncementsModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  AnnouncementsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
AnnouncementsModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => AnnouncementsModel(  status: status ?? _status,
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

/// announcements : [{"id":1,"title":"The Maritime Safety Committee","description":"The Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996.\r\n\r\n- to familiarize passengers with their assembly stations\r\n- to familiarize passengers with their life-saving equipment\r\n- to familiarize passengers with emergency procedures\r\n- all passengers must attend this drill. 1.2.1General emergency alarm\r\n\r\nI have pleasure in informing you that all safety equipment is in full working order. The bow/stern doors are closed and secure. The ship is in all respects ready for sea. Please listen carefully to the safety instructions which follow. In the unlikely event of an emergency, please obey the orders given on the public address system.\r\n\r\nThe Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996.","broadcast_date":"2024-01-23 15:59:34","status":1,"created_at":"2024-01-17T07:57:31.000000Z","updated_at":"2024-01-23T15:59:34.000000Z"}]

class Data {
  Data({
      List<Announcements>? announcements,}){
    _announcements = announcements;
}

  Data.fromJson(dynamic json) {
    if (json['announcements'] != null) {
      _announcements = [];
      json['announcements'].forEach((v) {
        _announcements?.add(Announcements.fromJson(v));
      });
    }
  }
  List<Announcements>? _announcements;
Data copyWith({  List<Announcements>? announcements,
}) => Data(  announcements: announcements ?? _announcements,
);
  List<Announcements>? get announcements => _announcements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_announcements != null) {
      map['announcements'] = _announcements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "The Maritime Safety Committee"
/// description : "The Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996.\r\n\r\n- to familiarize passengers with their assembly stations\r\n- to familiarize passengers with their life-saving equipment\r\n- to familiarize passengers with emergency procedures\r\n- all passengers must attend this drill. 1.2.1General emergency alarm\r\n\r\nI have pleasure in informing you that all safety equipment is in full working order. The bow/stern doors are closed and secure. The ship is in all respects ready for sea. Please listen carefully to the safety instructions which follow. In the unlikely event of an emergency, please obey the orders given on the public address system.\r\n\r\nThe Maritime Safety Committee, at its sixty-fourth session (5 to 9 December 1994), approved the attached \"On-board communication phrases for passenger care\", intended to be included in the \"Standard Marine Communication Phrases\" which are under development and expected to be available after 1996."
/// broadcast_date : "2024-01-23 15:59:34"
/// status : 1
/// created_at : "2024-01-17T07:57:31.000000Z"
/// updated_at : "2024-01-23T15:59:34.000000Z"

class Announcements {
  Announcements({
      num? id, 
      String? title, 
      String? description, 
      String? broadcastDate, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _description = description;
    _broadcastDate = broadcastDate;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Announcements.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _broadcastDate = json['broadcast_date'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _broadcastDate;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Announcements copyWith({  num? id,
  String? title,
  String? description,
  String? broadcastDate,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Announcements(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  broadcastDate: broadcastDate ?? _broadcastDate,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get broadcastDate => _broadcastDate;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['broadcast_date'] = _broadcastDate;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}