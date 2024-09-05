part of '../loginBloc/login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginUserEvent extends LoginEvent {

  final String? email;
  final dynamic password;

  LoginUserEvent({
    required this.email,
    required this.password
});
}
