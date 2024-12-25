part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

class GetBestSellerEvent extends HomeEvent {}

class GetWishlistEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;
  AddToWishlistEvent(this.productId);
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int productId;
  RemoveFromWishlistEvent(this.productId);
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

class UpdateCartItemEvent extends HomeEvent {
  final int cartItemId;
  final int quantity;

  UpdateCartItemEvent({required this.cartItemId, required this.quantity});
}

class PlaceOrderEvent extends HomeEvent {
  String? name;
  String? phone;
  String? email;
  String? governorateId;
  String? address;

  PlaceOrderEvent({
    this.name,
    this.phone,
    this.email,
    this.governorateId,
    this.address,
  });
}
