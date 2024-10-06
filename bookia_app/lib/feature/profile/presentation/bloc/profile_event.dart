import 'package:bookia_app/feature/auth/data/models/response/login_response_model/user.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  UserModel model;

  UpdateProfileEvent({required this.model});
}
