import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/Place%20Order/PlaceorderResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());


  placeOrder({
    required String name,
    required String email,
    required String address,
    required int cityId,
    required String phone,

}) async {
    emit(PlaceOrderLoading());
    try {
      var response = await ApiManager.placeOrder(
        address: address,
        phone: phone,
        name: name,
        email: email,
        cityId: cityId

      );

      emit(PlaceOrderSuccess(response));
    } on TimeoutException catch (ex) {
      emit(PlaceOrderError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(PlaceOrderError('$ex'));
    }
  }

}
