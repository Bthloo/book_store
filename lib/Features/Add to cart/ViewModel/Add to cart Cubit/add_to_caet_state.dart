part of 'add_to_caet_cubit.dart';

abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}
class AddToCartLoading extends AddToCartState {}
class AddToCartSuccess extends AddToCartState {
  AddToCartResponse addToCartResponse;
  AddToCartSuccess(this.addToCartResponse);
}
class AddToCartError extends AddToCartState {
  String message;
  AddToCartError(this.message);
}
