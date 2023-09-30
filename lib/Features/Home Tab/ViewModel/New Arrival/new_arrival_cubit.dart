import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Home%20Tab/Models/New%20Arrival/NewArrivalResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'new_arrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit() : super(NewArrivalInitial());
  newArrival() async {
    emit(NewArrivalLoading());
    try {
      var response = await ApiManager.newArrival();

      emit(NewArrivalSuccess(response));
    } on TimeoutException catch (ex) {
      emit(NewArrivalError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(NewArrivalError('$ex'));
    }
  }
}
