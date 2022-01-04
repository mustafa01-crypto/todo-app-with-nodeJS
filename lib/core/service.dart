import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_app/core/model/toddo_register.dart';

import 'model/post_model.dart';
import 'model/students.dart';
import 'model/token_model.dart';

class Service {
  final url = "http://10.0.2.2:3000/post";
  final todo_register_url = "http://10.0.2.2:3000/users/signup";
  final heroku = "https://crud-flutter-note.herokuapp.com/post";

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
      Uri.parse(todo_register_url),
      body: {'name': name, 'email': email, 'password': password},
    );
    if (request.statusCode == 201) {
      print(request.body);
      return todoRegisterFromJson(request.body);
    } else {
      throw "Unable to Tokens";
    }
  }
}
