import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';

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

class UpdateDoctorRegistrationEvent extends AuthEvent {
  final DoctorModel model;

  UpdateDoctorRegistrationEvent({required this.model});
}