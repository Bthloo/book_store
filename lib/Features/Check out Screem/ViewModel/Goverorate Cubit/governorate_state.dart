part of 'governorate_cubit.dart';


abstract class GovernorateState {}

class GovernorateInitial extends GovernorateState {}
class GovernorateLoading extends GovernorateState{}
class GovernorateSuccess extends GovernorateState{
  ShowGovernoratesResponse response;
  GovernorateSuccess(this.response);
}
class GovernorateError extends GovernorateState{
  String message;
  GovernorateError(this.message);
}

