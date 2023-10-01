import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Books%20Tab/Model/ProductsResponse.dart';
import 'package:meta/meta.dart';

import '../../../Core/Api Manager/api_manager.dart';
import '../Model/ProductsResponse.dart';
import '../Model/ProductsResponse.dart';
import '../Model/ProductsResponse.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  product({required int page}) async {
    emit(ProductsLoading());
    try {
      var response = await ApiManager.products(page: page);

      emit(ProductsSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(ProductsError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(ProductsError('$ex'));
    }
  }



}
