part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {

  final Map<String, dynamic> userData;

  LoginSuccess({required this.userData,});
}

class LoginFailure extends LoginState {}
