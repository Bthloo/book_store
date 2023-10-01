



import 'package:flutter/cupertino.dart';

import '../../Models/Login Model/LoginResponse.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
 LoginResponse loginResponse;
  //String message;
 LoginSuccess(this.loginResponse);
}

class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}