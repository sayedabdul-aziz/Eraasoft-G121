part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

class GetBestSellerEvent extends HomeEvent {}

class GetWishlistEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;

  AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int productId;

  RemoveFromWishlistEvent({required this.productId});
}

// cart
class GetCartEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends HomeEvent {
  final int cartItemId;

  RemoveFromCartEvent({required this.cartItemId});
}
