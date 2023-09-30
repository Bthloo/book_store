import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Home%20Tab/Models/Best%20Seller%20Model/BestSellerResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  bestSeller() async {
    emit(BestSellerLoading());
    try {
      var response = await ApiManager.bestSeller();

      emit(BestSellerSuccess(response));
    } on TimeoutException catch (ex) {
      emit(BestSellerError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(BestSellerError('$ex'));
    }
  }
}
