part of 'show_all_wishlist_cubit.dart';

abstract class ShowAllWishlistState {}

class ShowAllWishlistInitial extends ShowAllWishlistState {}
class ShowAllWishlistLoading extends ShowAllWishlistState {}
class ShowAllWishlistSuccess extends ShowAllWishlistState {
  ShowWishlistResponse showWishlistResponse;
  ShowAllWishlistSuccess(this.showWishlistResponse);
}
class ShowAllWishlistError extends ShowAllWishlistState {
  String errorMessage;
  ShowAllWishlistError(this.errorMessage);
}
