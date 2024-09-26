import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/services/local_storage.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);
      User user = userCredential.user!;
      AppLocalStorage.cacheData(
          key: AppLocalStorage.userToken, value: user.uid);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState("الحساب غير موجود"));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState("كلمة المرور غير صحيحة"));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما.'));
    }
  }

  register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User user = userCredential.user!;
      user.updateDisplayName(event.name);
      // store user data into our database
      if (event.userType == UserType.patient) {
        await FirebaseFirestore.instance
            .collection("patients")
            .doc(user.uid)
            .set({
          'name': event.name,
          'image': '',
          'age': null,
          'email': event.email,
          'phone': '',
          'bio': '',
          'city': '',
          'uid': user.uid,
        });
      } else {
        await FirebaseFirestore.instance
            .collection("doctors")
            .doc(user.uid)
            .set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user.uid,
        });
      }
      AppLocalStorage.cacheData(
          key: AppLocalStorage.userToken, value: user.uid);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة المرور ضعيفة.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('الحساب مستخدم بالفعل.'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ ما.'));
    }
  }
}
