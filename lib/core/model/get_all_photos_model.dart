// To parse this JSON data, do
//
//     final getAllPhotos = getAllPhotosFromJson(jsonString);

import 'dart:convert';

GetAllPhotos getAllPhotosFromJson(String str) =>
    GetAllPhotos.fromJson(json.decode(str));

String getAllPhotosToJson(GetAllPhotos data) => json.encode(data.toJson());

class GetAllPhotos {
  GetAllPhotos({
    this.photos,
  });

  List<Photo>? photos;

  factory GetAllPhotos.fromJson(Map<String, dynamic> json) => GetAllPhotos(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
      };
}

class Photo {
  Photo({
    this.id,
    this.photo,
    this.v,
  });

  String? id;
  String? photo;
  int? v;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["_id"],
        photo: json["photo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "photo": photo,
        "__v": v,
      };
}
