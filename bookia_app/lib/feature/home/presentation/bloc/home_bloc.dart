import 'dart:developer';

import 'package:bookia_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSellerBooks);
    on<GetHomeBannerEvent>(getHomeBanner);
    on<AddToWishlistEvent>(addToWishlist);
    on<GetWishlistEvent>(getWishlist);
    on<RemoveFromWishlistEvent>(removeFromWishlist);
    on<GetCartEvent>(getCart);
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
    on<PlaceOrderEvent>(placeOrder);
  }

  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;
  GetCartResponseModel? getCartResponseModel;

  Future<void> getBestSellerBooks(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerLoadingState());

    try {
      await HomeRepo.getBestSellerBooks().then((value) {
        if (value != null) {
          bestSellerResponseModel = value;
          emit(BestSellerLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> getHomeBanner(
      GetHomeBannerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBannerLoadingState());

    try {
      await HomeRepo.getHomeBanner().then((value) {
        if (value != null) {
          homeBannerResponseModel = value;
          emit(HomeBannerLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> getWishlist(
      GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());

    try {
      await HomeRepo.getWishlist().then((value) {
        if (value != null) {
          getWishlistResponseModel = value;
          emit(GetWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> addToWishlist(
      AddToWishlistEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());

    try {
      await HomeRepo.addToWishlist(productId: event.productId).then((value) {
        if (value) {
          emit(AddToWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> removeFromWishlist(
      RemoveFromWishlistEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishlistLoadingState());

    try {
      await HomeRepo.removeFromWishlist(productId: event.productId)
          .then((value) {
        if (value) {
          emit(RemoveFromWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  // cart
  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());

    try {
      await HomeRepo.getCart().then((value) {
        if (value != null) {
          getCartResponseModel = value;
          emit(GetCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());

    try {
      await HomeRepo.addToCart(productId: event.productId).then((value) {
        if (value) {
          emit(AddToCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromCartLoadingState());

    try {
      await HomeRepo.removeFromCart(cartId: event.cartItemId).then((value) {
        if (value) {
          emit(RemoveFromCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> placeOrder(
      PlaceOrderEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());

    try {
      await HomeRepo.placeOrder(
              name: event.name,
              email: event.email,
              phone: event.phone,
              governorateId: event.governorateId,
              address: event.address)
          .then((value) {
        if (value) {
          emit(AddToWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }
}
