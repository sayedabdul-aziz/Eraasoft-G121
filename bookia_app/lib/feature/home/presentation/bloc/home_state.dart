part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

// banner
class HomeBannerLoadingState extends HomeState {}

class HomeBannerLoadedState extends HomeState {}

// best seller
class BestSellerLoadingState extends HomeState {}

class BestSellerLoadedState extends HomeState {}

class HomeErrorState extends HomeState {}
