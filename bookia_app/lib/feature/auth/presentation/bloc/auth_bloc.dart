import 'dart:developer';

import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      await AuthRepo.register(event.params).then((value) {
       
        if (value != null) {
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
}
