import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_todolist/createUser/newUserRepo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'new_user_event.dart';
part 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc() : super(NewUserInitial()) {

    on<addNewUserEvent>((event, emit) async{

      try{

        final newUser = await AddNewUserRepo().addUser(event.lastname, event.firstname, event.email, event.password, event.username);

        if(newUser.statusCode == 200) {
          final infoNewUser = jsonDecode(newUser.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", infoNewUser['token']);
          emit(NewUserAdded());
        }else{
          emit(NewUserNotAdded());
        }
      }catch(e){
        print("Erreur lors de la création de compte : $e");
      }

    });
  }
}
