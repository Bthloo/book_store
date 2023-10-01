part of 'update_cubit.dart';

abstract class UpdateState {}

class UpdateInitial extends UpdateState {
}

class UpdateLoading extends UpdateState {}

class UpdateSuccess extends UpdateState {
  String message;
  UpdateSuccess(this.message);
}

class UpdateError extends UpdateState {
  String message;
  UpdateError(this.message);
}