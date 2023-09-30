
import 'package:bloc/bloc.dart';
import 'package:book_store/Features/WishList%20Tab/View/Pages/wishlist_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Home Tab/View/Pages/home_tab.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);
  int currentTapIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    WishListTab(),

  ];

  void changeIndex(int index) {
    currentTapIndex = index;

    emit(ChangeHomeScreenState());
  }
}
