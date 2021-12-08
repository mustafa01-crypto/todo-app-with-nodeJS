// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  TokenModel({
    this.accesstoken,
  });

  String? accesstoken;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    accesstoken: json["accesstoken"],
  );

  Map<String, dynamic> toJson() => {
    "accesstoken": accesstoken,
  };
}
