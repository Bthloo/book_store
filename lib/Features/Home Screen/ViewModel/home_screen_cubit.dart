
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Books Tab/View/Pages/books_tab.dart';
import '../../Cart Tab/View/Pages/cart_tab.dart';
import '../../Favirite tab/View/Pages/favorite_tab.dart';
import '../../Home Tab/View/Pages/home_tab.dart';
import '../../Profile tab/View/Pages/profiile_tab.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);
  int currentTapIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    BooksTab(),
    FavoriteTab(),
    CartTab(),
    ProfileTab()
  ];

  void changeIndex(int index) {
    currentTapIndex = index;

    emit(ChangeHomeScreenState());
  }
}
