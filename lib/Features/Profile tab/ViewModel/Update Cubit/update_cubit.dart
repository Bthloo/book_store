import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());


  update(
      {
        required String email,
        required  String name,
        required String phone,
        required String address,
        required String city
      }) async {
    emit(UpdateLoading());
    try {
      var response = await ApiManager.update(
          email: email,
          name: name,
        phone: phone,
        address: address,
        city: city
      );

      emit(UpdateSuccess(response.message??''));
    } on TimeoutException catch (ex) {
      emit(UpdateError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(UpdateError('$ex'));
    }
  }
}
