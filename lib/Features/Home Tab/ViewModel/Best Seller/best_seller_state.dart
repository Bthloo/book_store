part of 'best_seller_cubit.dart';

@immutable
abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  BestSellerResponse bestSellerResponse;
  BestSellerSuccess(this.bestSellerResponse);
}

class BestSellerError extends BestSellerState {
  String message;
  BestSellerError(this.message);
}
