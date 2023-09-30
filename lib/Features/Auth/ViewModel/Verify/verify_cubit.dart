import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  verify(
      {
        required  String verify,
      }) async {
    emit(VerifyLoading());
    try {
      var response = await ApiManager.verifyEmail(
       verify: verify
      );

      emit(VerifySuccess(response.message??''));
    } on TimeoutException catch (ex) {
      emit(VerifyError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(VerifyError('$ex'));
    }
  }
}
