import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Home%20Tab/Models/All%20Categories/AllCategoriesResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit() : super(AllCategoriesInitial());

  allCategories() async {
    emit(AllCategoriesLoading());
    try {
      var response = await ApiManager.allCategories();

      emit(AllCategoriesSuccess(response));
    } on TimeoutException catch (ex) {
      emit(AllCategoriesError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(AllCategoriesError('$ex'));
    }
  }
}
