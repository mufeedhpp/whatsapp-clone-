// To parse this JSON data, do
//
//     final singlechat = singlechatFromJson(jsonString);

import 'dart:convert';

Singlechat singlechatFromJson(String str) => Singlechat.fromJson(json.decode(str));

String singlechatToJson(Singlechat data) => json.encode(data.toJson());

class Singlechat {
    Singlechat({
        this.isSend,
        this.isRead,
        this.message,
        this.sendAt,
    });

    bool ?isSend;
    bool? isRead;
    String? message;
    String ?sendAt;

    factory Singlechat.fromJson(Map<String, dynamic> json) => Singlechat(
        isSend: json["isSend"],
        isRead: json["isRead"],
        message: json["Message"],
        sendAt: json["sendAt"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isRead": isRead,
        "Message": message,
        "sendAt": sendAt,
    };
}
