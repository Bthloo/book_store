import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Api Manager/api_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());



  register(
      {
        required String email,
        required  String password,
        required  String name,
        required  String rePassword,
      }) async {
    emit(RegisterLoading());
    try {
      var response = await ApiManager.register(
        email: email,
        password: password,
        passwordConfirmation: rePassword,
        name: name
      );

      emit(RegisterSuccess(response.message??''));
    } on TimeoutException catch (ex) {
      emit(RegisterError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(RegisterError('$ex'));
    }
  }

}
