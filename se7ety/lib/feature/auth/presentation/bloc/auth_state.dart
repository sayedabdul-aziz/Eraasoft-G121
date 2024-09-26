class AuthState {}

class AuthInitial extends AuthState {}

// LOGIN

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

// Register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

// error

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
