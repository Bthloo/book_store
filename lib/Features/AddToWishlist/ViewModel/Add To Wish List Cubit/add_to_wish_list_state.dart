part of 'add_to_wish_list_cubit.dart';

abstract class AddToWishListState {}

class AddToWishListInitial extends AddToWishListState {}
class AddToWishListLoading extends AddToWishListState {}
class AddToWishListSuccess extends AddToWishListState {
  AddToWishList addToWishList;
  AddToWishListSuccess(this.addToWishList);
}
class AddToWishListError extends AddToWishListState {
  String message;
  AddToWishListError(this.message);
}
