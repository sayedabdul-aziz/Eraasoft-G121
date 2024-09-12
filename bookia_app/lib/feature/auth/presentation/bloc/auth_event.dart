import 'package:bookia_app/feature/auth/data/models/request/register_params.dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  RegisterEvent(this.params);
}
