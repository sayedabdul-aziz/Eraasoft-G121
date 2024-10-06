import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
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

  static Future<bool> addToWishlist({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.addToWishlistEndpoints,
          data: {
            "product_id": productId
          },
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

  static Future<bool> removeFromWishlist({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.removeFromWishlistEndpoints,
          data: {
            "product_id": productId
          },
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

  static Future<GetWishlistResponseModel?> getWishlist() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getWishlistEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        var model = GetWishlistResponseModel.fromJson(response.data);
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
  static Future<bool> addToCart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.addToCartEndpoints,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromCart({required int cartId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.removeFromCartEndpoints,
          data: {
            "cart_item_id": cartId
          },
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

  static Future<GetCartResponseModel?> getCart() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getCartEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        var model = GetCartResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> placeOrder(
      {String? name,
      String? email,
      String? phone,
      String? governorateId,
      String? address}) async {
    try {
      var response =
          await DioProvider.post(endpoint: 'place-order', queryParameters: {
        'name': name,
        'email': email,
        'phone': phone,
        'governorate_id': governorateId,
        'address': address
      }, headers: {
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
