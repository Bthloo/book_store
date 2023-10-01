import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../Core/Api Manager/api_manager.dart';
import '../../Models/Login Model/LoginResponse.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginResponse userModel = LoginResponse();

  login(
      {
        required String email,
        required  String password,
      }) async {
    emit(LoginLoading());
    try {
      var response = await ApiManager.login(
          email: email,
          password: password,
          );
      userModel.data = response.data;

      emit(LoginSuccess(response));
    } on TimeoutException catch (ex) {
      emit(LoginError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(LoginError('$ex'));
    }
  }
}
