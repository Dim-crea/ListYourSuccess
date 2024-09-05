import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/Repository/LoginRepo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part '../LoginEvent/login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginUserEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      try{
        final login = await LoginUserRepo().loginUser(event.email, event.password);

        if(login.statusCode == 200){
          final infoUser = jsonDecode(login.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", infoUser['token']);
          emit(LoginSuccess(userData: infoUser));
        } else {
          emit(LoginFailure());
        }
      }catch(e){
        print("Erreur lors de la connexion : $e");
      }
    });
  }
}
