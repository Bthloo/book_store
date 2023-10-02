import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Add%20to%20cart/Model/Add%20to%20Cart/AddToCartResponde.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'add_to_caet_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());


  addToCart(int id) async {
    emit(AddToCartLoading());
    try {
      var response = await ApiManager.addToCart(id);

      emit(AddToCartSuccess(response));
    } on TimeoutException catch (ex) {
      emit(AddToCartError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(AddToCartError('$ex'));
    }
  }


}
