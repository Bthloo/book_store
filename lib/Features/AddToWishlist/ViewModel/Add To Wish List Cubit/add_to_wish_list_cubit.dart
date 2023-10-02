import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/AddToWishlist/Model/AddToWishList.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'add_to_wish_list_state.dart';

class AddToWishListCubit extends Cubit<AddToWishListState> {
  AddToWishListCubit() : super(AddToWishListInitial());

  addToWishList(int id) async {
    emit(AddToWishListLoading());
    try {
      var response = await ApiManager.addToWishList(id);

      emit(AddToWishListSuccess(response));
    } on TimeoutException catch (ex) {
      emit(AddToWishListError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(AddToWishListError('$ex'));
    }
  }
}
