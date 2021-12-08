// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) =>
    List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

class Students {
  Students({
    this.id,
    this.name,
    this.surname,
    this.number,
  });

  String? id;
  String? name;
  String? surname;
  String? number;

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      id: json['_id'],
      name: json['name'],
      surname: json['surname'],
      number: json['number'],
    );
  }
}
