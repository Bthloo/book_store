import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Books%20Tab/Model/Search%20Model/SearchResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  search({required String keyWord}) async {
    emit(SearchLoading());
    try {
      var response = await ApiManager.search(keyWord: keyWord);

      emit(SearchSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(SearchError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(SearchError('$ex'));
    }
  }
}
