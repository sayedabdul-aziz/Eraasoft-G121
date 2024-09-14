class AuthState {}

class AuthInitial extends AuthState {}

// Register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}

// Login

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}
