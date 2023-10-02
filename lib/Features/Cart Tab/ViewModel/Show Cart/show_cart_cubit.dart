import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Cart%20Tab/Models/Show%20Cart/ShowCartResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'show_cart_state.dart';

class ShowCartCubit extends Cubit<ShowCartState> {
  ShowCartCubit() : super(ShowCartInitial());
  static ShowCartCubit get(BuildContext context) => BlocProvider.of(context);

  showCart() async {
    emit(ShowCartLoading());
    try {
      var response = await ApiManager.showCart();

      emit(ShowCartSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(ShowCartError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(ShowCartError('$ex'));
    }
  }
}
