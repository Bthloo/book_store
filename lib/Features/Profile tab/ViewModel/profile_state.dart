part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  ProfileResponse? response;
  ProfileSuccess(this.response);
}
class ProfileError extends ProfileState {
  String? message;
  ProfileError(this.message);
}
