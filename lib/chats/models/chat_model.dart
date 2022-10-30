// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.messege,
        this.updatedAt,
        this.isGroup,
        this.image,
    });

    String? name;
    String? messege;
    String? updatedAt;
    bool? isGroup;
    String? image;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        messege: json["messege"],
        updatedAt: json["UpdatedAt"],
        isGroup: json["isGroup"],
        image: json["Image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "messege": messege,
        "UpdatedAt": updatedAt,
        "isGroup": isGroup,
        "Image": image,
    };
}
