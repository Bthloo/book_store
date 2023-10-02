import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Add%20to%20cart/Model/Remove%20From%20Cart/RemoveFromCart.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit() : super(RemoveFromCartInitial());

  removeFromCart( int id) async {
    emit(RemoveFromCartLoading());
    try {
      var response = await ApiManager.removeFromCart(id);

      emit(RemoveFromCartSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(RemoveFromCartError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(RemoveFromCartError('$ex'));
    }
  }
}
