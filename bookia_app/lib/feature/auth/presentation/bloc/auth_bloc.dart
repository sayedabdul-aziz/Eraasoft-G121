import 'dart:developer';

import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      await AuthRepo.register(event.params).then((value) {
        if (value != null) {
          // cache token
          AppLocalStorage.cacheData(
              key: AppLocalStorage.token, value: value.data?.token);

          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState("Something Error Occurred"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(RegisterErrorState("Something went wrong"));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      await AuthRepo.login(email: event.email, password: event.password)
          .then((value) {
        if (value != null) {
          // cache token
          AppLocalStorage.cacheData(
              key: AppLocalStorage.token, value: value.data?.token);
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState("Something Error Occurred"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginErrorState("Something went wrong"));
    }
  }
}
