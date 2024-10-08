import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/feature/auth/data/models/request/register_params.dart';
import 'package:bookia_app/feature/auth/data/models/response/login_response_model/login_response_model.dart';

class AuthRepo {
  // Dio , Http
  static Future<LoginResponseModel?> register(RegisterParams params) async {
    // 2) call Api with specified Method (get or post or put or delete)
    // 3) check status code (200 Ok) or other Failures.
    // 5) if 200 => parse json response to model and return it.
    // 6) handle Failures

    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.registerEndpoints, data: params.toJson());
      if (response.statusCode == 201) {
        var model = LoginResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<LoginResponseModel?> login(
      {required String email, required String password}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.loginEndpoints,
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var model = LoginResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
