part of 'show_cart_cubit.dart';

abstract class ShowCartState {}

class ShowCartInitial extends ShowCartState {}
class ShowCartLoading extends ShowCartState {}
class ShowCartSuccess extends ShowCartState {
  ShowCartResponse showCartResponse;
  ShowCartSuccess(this.showCartResponse);
}
class ShowCartError extends ShowCartState {
  String message;
  ShowCartError(this.message);
}
