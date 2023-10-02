part of 'checkout_cubit.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {
  CheckOutResponse checkOutResponse;
  CheckoutSuccess(this.checkOutResponse);
}
class CheckoutError extends CheckoutState {
  String message;
  CheckoutError(this.message);
}
