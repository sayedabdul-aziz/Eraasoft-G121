import 'package:se7ety/core/enum/user_type_enum.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final UserType userType;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.userType,
  });
}
