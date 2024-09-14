import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.bestSellerBooksEndpoints);
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<HomeBannerResponseModel?> getHomeBanner() async {
    try {
      var response =
          await DioProvider.get(endpoint: AppConstants.homeBannerEndpoints);
      if (response.statusCode == 200) {
        var model = HomeBannerResponseModel.fromJson(response.data);
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
