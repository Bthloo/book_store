import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/Features/Profile%20tab/Model/ProfileResponse.dart';
import 'package:meta/meta.dart';

import '../../../Core/Api Manager/api_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  profile() async {
    emit(ProfileLoading());
    try {
      var response = await ApiManager.profile();

      emit(ProfileSuccess(response));
    } on TimeoutException catch (ex) {
      emit(ProfileError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(ProfileError('$ex'));
    }
  }
}
