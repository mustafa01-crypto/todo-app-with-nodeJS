import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_app/core/model/get_all_photos_model.dart';
import 'package:todo_app/core/model/image.dart';
import 'package:todo_app/core/model/toddo_register.dart';

import 'model/covid_model.dart';
import 'model/post_model.dart';
import 'model/students.dart';
import 'model/token_model.dart';

class Service {
  final photoUrl = "http://10.0.2.2:3000/users/photos";
  final url = "http://10.0.2.2:3000/post";
  final todoRegisterUrl = "http://10.0.2.2:3000/users/signup";
  final todoLoginUrl = "http://10.0.2.2:3000/users/login";
  final heroku = "https://crud-flutter-note.herokuapp.com/post";

  var baseUrl =
      "https://api.collectapi.com/corona/countriesData?country=Turkey";

  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        "apikey 6rzDJTIZ8zmdE16C8bhRWi:1gF8lAE2Rue7VDBWbw9PoE",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  Future<List<Students>> getArticle() async {
    Response res = await http.get(
      Uri.parse(heroku),
    );

    List<dynamic> json = jsonDecode(res.body);

    List<Students> articles =
        json.map((dynamic item) => Students.fromJson(item)).toList();

    if (res.statusCode == 200) {
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  void deleteUser(BuildContext context, String id) async {
    Response res = await http.delete(
      Uri.parse('$heroku/$id'),
    );
  }

  Future<PostStudent> addStudents(
      String name, String surname, String number) async {
    final request = await http.post(
      Uri.parse(heroku),
      body: {'name': name, 'surname': surname, 'number': number},
    );
    if (request.statusCode == 200) {
      print(request.body);
      return postStudentFromJson(request.body);
    } else {
      throw "Unable to post students";
    }
  }

  Future<TokenModel> updateStudent(
      String id, String name, String surname, String number) async {
    final request = await http.put(
      Uri.parse('$heroku/$id'),
      body: {'name': name, 'surname': surname, 'number': number},
    );
    if (request.statusCode == 200) {
      print(request.body);
      var map = request.body;
      return TokenModel.fromJson(jsonDecode(map));
    } else {
      throw "Unable to Tokens";
    }
  }

  Future<TodoRegister> todoRegister(
      String name, String email, String password) async {
    final request = await http.post(
      Uri.parse(todoRegisterUrl),
      body: {'name': name, 'email': email, 'password': password},
    );
    if (request.statusCode == 201) {
      print(request.body);
      return todoRegisterFromJson(request.body);
    } else {
      throw "Unable to Tokens";
    }
  }

  Future<List<Resultc>> getCovid() async {
    Response res = await http.get(Uri.parse(baseUrl), headers: headers);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Resultc> result =
          body.map((dynamic item) => Resultc.fromJson(item)).toList();

      return result;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future uploadImage(String image) async {
    Response res = await http.post(Uri.parse(photoUrl), body: {'photo': image});

    if (res.statusCode == 201) {
      print(res.body);
      return "ok";
    } else {
      throw ("Can't post the Image");
    }
  }

  //
  Future<bool> addImage(String filepath) async {
    String addimageUrl = 'http://10.0.2.2:3000/users/photos';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<GetAllPhotos> getAllPhotos() async {
    Response res = await http.get(Uri.parse(photoUrl));

    if (res.statusCode == 200) {
      print(res.body);

      return getAllPhotosFromJson(res.body);
    } else {
      throw "Something went wrong";
    }
  }
}
