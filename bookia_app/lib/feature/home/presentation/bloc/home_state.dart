part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

// banner
class HomeBannerLoadingState extends HomeState {}

class HomeBannerLoadedState extends HomeState {}

// best seller
class BestSellerLoadingState extends HomeState {}

class BestSellerLoadedState extends HomeState {}

// wishlist

class GetWishlistLoadingState extends HomeState {}

class GetWishlistLoadedState extends HomeState {}

class AddToWishlistLoadingState extends HomeState {}

class AddToWishlistLoadedState extends HomeState {}

class RemoveFromWishlistLoadingState extends HomeState {}

class RemoveFromWishlistLoadedState extends HomeState {}

// cart
class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

class AddToCartLoadingState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

class RemoveFromCartLoadingState extends HomeState {}

class RemoveFromCartLoadedState extends HomeState {}

class HomeErrorState extends HomeState {}
