import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Favirite%20tab/Model/Show%20Wishlist/ShowWishlistResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'show_all_wishlist_state.dart';

class ShowAllWishlistCubit extends Cubit<ShowAllWishlistState> {
  ShowAllWishlistCubit() : super(ShowAllWishlistInitial());


  showWishlist() async {
    emit(ShowAllWishlistLoading());
    try {
      var response = await ApiManager.showWishlist();

      emit(ShowAllWishlistSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(ShowAllWishlistError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(ShowAllWishlistError('$ex'));
    }
  }
}
