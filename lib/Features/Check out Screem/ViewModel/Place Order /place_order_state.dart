part of 'place_order_cubit.dart';

abstract class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}
class PlaceOrderLoading extends PlaceOrderState {}
class PlaceOrderSuccess extends PlaceOrderState {
  PlaceorderResponse placeorderResponse;
  PlaceOrderSuccess(this.placeorderResponse);
}
class PlaceOrderError extends PlaceOrderState {
  String message;
  PlaceOrderError(this.message);
}
