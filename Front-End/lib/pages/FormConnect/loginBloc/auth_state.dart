abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final Map<String, dynamic> userData;

  AuthAuthenticated({required this.userData});
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
