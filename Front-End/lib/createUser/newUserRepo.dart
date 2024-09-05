import 'package:flutter_todolist/pages/FormConnect/loginBloc/login_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewUserRepo {

  Future<http.Response> addUser(lastname, firstname, email, password, username) async {

    //call the api
    final newuser = await http.post(

        Uri.parse('http://172.27.241.86:4000/addNewUser'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(<String, dynamic>{
          'lastname': lastname,
          'firstname' : firstname,
          'email': email,
          'password': password,
          'username': username,
        })
    );
    return newuser;
  }
}
