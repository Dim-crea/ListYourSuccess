abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final Map<String, dynamic> userData;

  LoggedIn({required this.userData});
}

class LoggedOut extends AuthEvent {}
