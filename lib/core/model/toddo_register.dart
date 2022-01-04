// To parse this JSON data, do
//
//     final todoRegister = todoRegisterFromJson(jsonString);

import 'dart:convert';

TodoRegister todoRegisterFromJson(String str) =>
    TodoRegister.fromJson(json.decode(str));

String todoRegisterToJson(TodoRegister data) => json.encode(data.toJson());

class TodoRegister {
  TodoRegister({
    this.status,
    this.user,
  });

  String? status;
  User? user;

  factory TodoRegister.fromJson(Map<String, dynamic> json) => TodoRegister(
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.id,
    this.v,
  });

  String? name;
  String? email;
  String? password;
  String? id;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "_id": id,
        "__v": v,
      };
}
