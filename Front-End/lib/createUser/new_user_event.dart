part of 'new_user_bloc.dart';

@immutable
sealed class NewUserEvent {}

class addNewUserEvent extends NewUserEvent {

  final String? lastname;
  final String? firstname;
  final String? email;
  final String? password;
  final String? username;

  addNewUserEvent({
    required this.lastname,
    required this.firstname,
    required this.email,
    required this.password,
    required this.username
});
}