import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/Governrates/ShowGovernratesResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'governorate_state.dart';

class GovernorateCubit extends Cubit<GovernorateState> {
  GovernorateCubit() : super(GovernorateInitial());

  governorate() async {
    emit(  GovernorateLoading());
    try {
      var response = await ApiManager.getGovernorate();

      emit(  GovernorateSuccess(response));
      print(response.message);
    } on TimeoutException catch (ex) {
      emit(  GovernorateError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(  GovernorateError('$ex'));
    }
  }
}
