final class ProfileStates {}

final class ProfileInitial extends ProfileStates {}

// get profile

final class GetProfileLoadingState extends ProfileStates {}

final class GetProfileSuccessState extends ProfileStates {}

final class GetProfileErrorState extends ProfileStates {
  final String error;

  GetProfileErrorState(this.error);
}

final class UpdateProfileLoadingState extends ProfileStates {}

final class UpdateProfileSuccessState extends ProfileStates {}

final class UpdateProfileErrorState extends ProfileStates {
  final String error;

  UpdateProfileErrorState(this.error);
}
