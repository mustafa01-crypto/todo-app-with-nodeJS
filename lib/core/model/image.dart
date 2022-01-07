// To parse this JSON data, do
//
//     final uploadImage = uploadImageFromJson(jsonString);

import 'dart:convert';

UploadImage uploadImageFromJson(String str) =>
    UploadImage.fromJson(json.decode(str));

String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  UploadImage({
    this.course,
  });

  Course? course;

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "course": course!.toJson(),
      };
}

class Course {
  Course({
    this.photo,
    this.id,
    this.v,
  });

  String? photo;
  String? id;
  int? v;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        photo: json["photo"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "_id": id,
        "__v": v,
      };
}
