part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {
  String message;
  VerifySuccess(this.message);
}

class VerifyError extends VerifyState {
  String message;
  VerifyError(this.message);
}

