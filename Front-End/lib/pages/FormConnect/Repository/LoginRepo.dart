import 'package:flutter_todolist/pages/FormConnect/loginBloc/login_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginUserRepo {

  Future<http.Response> loginUser(email, password) async {

    //call the api
    final login = await http.post(

        Uri.parse('http://172.27.241.86:4000/login'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        })
    );
    return login;
  }
}

class AuthRepo {
    Future<http.Response> authUser (token) async {

      final authUser = await http.get(
        Uri.parse('http://172.27.241.86:4000'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return authUser;
    }
}