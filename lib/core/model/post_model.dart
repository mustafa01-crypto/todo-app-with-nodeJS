// To parse this JSON data, do
//
//     final postStudent = postStudentFromJson(jsonString);

import 'dart:convert';

PostStudent postStudentFromJson(String str) =>
    PostStudent.fromJson(json.decode(str));

String postStudentToJson(PostStudent data) => json.encode(data.toJson());

class PostStudent {
  PostStudent({
    this.name,
    this.surname,
    this.number,
    this.id,
    this.v,
  });

  String? name;
  String? surname;
  String? number;
  String? id;
  int? v;

  factory PostStudent.fromJson(Map<String, dynamic> json) => PostStudent(
        name: json["name"],
        surname: json["surname"],
        number: json["number"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "number": number,
        "_id": id,
        "__v": v,
      };
}
