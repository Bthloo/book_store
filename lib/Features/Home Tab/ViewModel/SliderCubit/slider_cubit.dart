import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Home%20Tab/Models/Slider%20Model/SliderResponse.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  getSlider() async {
    emit(SliderLoading());
    try {
      var response = await ApiManager.getSlider();

      emit(SliderSuccess(response));
    } on TimeoutException catch (ex) {
      emit(SliderError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(SliderError('$ex'));
    }
  }
}
