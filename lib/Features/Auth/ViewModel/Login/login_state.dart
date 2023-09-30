



import '../../Models/Login Model/login_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
 //LoginResponse loginResponse;
  String message;
 LoginSuccess(this.message);
}

class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}