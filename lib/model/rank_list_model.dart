/// status : true
/// message : "Rank List."
/// data : {"rank_list":[{"id":1,"category_id":1,"rank":"Master"},{"id":2,"category_id":1,"rank":"Chief Officer"},{"id":3,"category_id":1,"rank":"Second Officer"},{"id":4,"category_id":1,"rank":"Third Officer"},{"id":5,"category_id":1,"rank":"Junior Officer"},{"id":6,"category_id":1,"rank":"Cadet"},{"id":7,"category_id":1,"rank":"Chief Engineer"},{"id":8,"category_id":1,"rank":"Second Engineer"},{"id":9,"category_id":1,"rank":"Third Engineer"},{"id":10,"category_id":1,"rank":"Forth Engineer"},{"id":11,"category_id":1,"rank":"Junior Engineer"},{"id":12,"category_id":1,"rank":"TME"},{"id":13,"category_id":1,"rank":"Electrical Officer"}]}

class RankListModel {
  RankListModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RankListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
RankListModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => RankListModel(  status: status ?? _status,
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

/// rank_list : [{"id":1,"category_id":1,"rank":"Master"},{"id":2,"category_id":1,"rank":"Chief Officer"},{"id":3,"category_id":1,"rank":"Second Officer"},{"id":4,"category_id":1,"rank":"Third Officer"},{"id":5,"category_id":1,"rank":"Junior Officer"},{"id":6,"category_id":1,"rank":"Cadet"},{"id":7,"category_id":1,"rank":"Chief Engineer"},{"id":8,"category_id":1,"rank":"Second Engineer"},{"id":9,"category_id":1,"rank":"Third Engineer"},{"id":10,"category_id":1,"rank":"Forth Engineer"},{"id":11,"category_id":1,"rank":"Junior Engineer"},{"id":12,"category_id":1,"rank":"TME"},{"id":13,"category_id":1,"rank":"Electrical Officer"}]

class Data {
  Data({
      List<RankList>? rankList,}){
    _rankList = rankList;
}

  Data.fromJson(dynamic json) {
    if (json['rank_list'] != null) {
      _rankList = [];
      json['rank_list'].forEach((v) {
        _rankList?.add(RankList.fromJson(v));
      });
    }
  }
  List<RankList>? _rankList;
Data copyWith({  List<RankList>? rankList,
}) => Data(  rankList: rankList ?? _rankList,
);
  List<RankList>? get rankList => _rankList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_rankList != null) {
      map['rank_list'] = _rankList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// category_id : 1
/// rank : "Master"

class RankList {
  RankList({
      num? id, 
      num? categoryId, 
      String? rank,}){
    _id = id;
    _categoryId = categoryId;
    _rank = rank;
}

  RankList.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _rank = json['rank'];
  }
  num? _id;
  num? _categoryId;
  String? _rank;
RankList copyWith({  num? id,
  num? categoryId,
  String? rank,
}) => RankList(  id: id ?? _id,
  categoryId: categoryId ?? _categoryId,
  rank: rank ?? _rank,
);
  num? get id => _id;
  num? get categoryId => _categoryId;
  String? get rank => _rank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['rank'] = _rank;
    return map;
  }

}