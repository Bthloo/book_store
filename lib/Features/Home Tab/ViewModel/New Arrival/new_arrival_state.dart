part of 'new_arrival_cubit.dart';

@immutable
abstract class NewArrivalState {}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalSuccess extends NewArrivalState {
  NewArrivalResponse newArrivalResponse;
  NewArrivalSuccess(this.newArrivalResponse);
}

class NewArrivalError extends NewArrivalState {
   String? message;
   NewArrivalError(this.message);
}
