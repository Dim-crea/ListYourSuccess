import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/Repository/LoginRepo.dart';
import '../LoginEvent/auth_event.dart';
import 'auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield AuthLoading();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        // Effectuez une requête pour obtenir les informations utilisateur
        final response = await AuthRepo().authUser(token);

        if (response.statusCode == 200) {
          final userData = json.decode(response.body);
          yield AuthAuthenticated(userData: userData);
        } else {
          yield AuthUnauthenticated();
        }
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthAuthenticated(userData: event.userData);
    }

    if (event is LoggedOut) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      yield AuthUnauthenticated();
    }
  }
}
