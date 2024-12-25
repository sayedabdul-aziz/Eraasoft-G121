import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/feature/auth/data/models/response/login_response_model/user.dart';
import 'package:bookia_app/feature/profile/data/model/get_profile_response/get_profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  static Future<GetProfileResponse?> getProfileData() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getProfileEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        var model = GetProfileResponse.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

// cart
  static Future<bool> updateProfile(UserModel model) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.updateProfileEndpoints,
          data: FormData.fromMap({
            'name': model.name,
            if (model.image != null)
              'image': await MultipartFile.fromFile(model.image!,
                  filename: model.image?.split('/').last),
            'phone': model.phone,
            'address': model.address,
          }),
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
