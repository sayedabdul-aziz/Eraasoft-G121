import 'dart:developer';

import 'package:bookia_app/feature/profile/data/model/get_profile_response/get_profile_response.dart';
import 'package:bookia_app/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia_app/feature/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_app/feature/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(getProfile);
    on<UpdateProfileEvent>(updateProfile);
  }

  GetProfileResponse? profileResponse;
  // get profile
  getProfile(GetProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(GetProfileLoadingState());

    try {
      await ProfileRepo.getProfileData().then((value) {
        if (value != null) {
          profileResponse = value;
          emit(GetProfileSuccessState());
        } else {
          emit(GetProfileErrorState('Something went wrong'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(GetProfileErrorState('Something went wrong'));
    }
  }

  updateProfile(UpdateProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(UpdateProfileLoadingState());

    try {
      await ProfileRepo.updateProfile(event.model).then((value) {
        if (value) {
          emit(UpdateProfileSuccessState());
        } else {
          emit(UpdateProfileErrorState('Something went wrong'));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(UpdateProfileErrorState('Something went wrong'));
    }
  }
}
