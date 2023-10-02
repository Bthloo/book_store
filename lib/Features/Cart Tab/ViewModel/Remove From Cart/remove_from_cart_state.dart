part of 'remove_from_cart_cubit.dart';

abstract class RemoveFromCartState {}

class RemoveFromCartInitial extends RemoveFromCartState {}
class RemoveFromCartLoading extends RemoveFromCartState {}
class RemoveFromCartSuccess extends RemoveFromCartState{
  RemoveFromCart removeFromCart;
  RemoveFromCartSuccess(this.removeFromCart);
}
class RemoveFromCartError extends RemoveFromCartState{
  String message;
  RemoveFromCartError(this.message);
}
