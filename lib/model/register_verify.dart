/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RegisterVerify registerVerifyFromJson(String str) => RegisterVerify.fromJson(json.decode(str));

String registerVerifyToJson(RegisterVerify data) => json.encode(data.toJson());

class RegisterVerify {
    RegisterVerify({
        required this.data,
        required this.message,
        required this.status,
    });

    List<dynamic> data;
    String message;
    bool status;

    factory RegisterVerify.fromJson(Map<dynamic, dynamic> json) => RegisterVerify(
        data: List<dynamic>.from(json["data"].map((x) => x)),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
        "status": status,
    };
}
