part of 'new_user_bloc.dart';

@immutable
sealed class NewUserState {}

final class NewUserInitial extends NewUserState {}

class NewUserAdded extends NewUserState {}

class NewUserNotAdded extends NewUserState {}