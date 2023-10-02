import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/CheckOutResponse.dart';
import 'package:meta/meta.dart';

import '../../../Core/Api Manager/api_manager.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());


  checkout() async {
    emit(CheckoutLoading());
    try {
      var response = await ApiManager.checkout();

      emit(CheckoutSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(CheckoutError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(CheckoutError('$ex'));
    }
  }

}
