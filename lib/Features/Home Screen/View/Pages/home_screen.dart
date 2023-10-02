import 'package:book_store/Features/Home%20Screen/ViewModel/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ViewModel/home_screen_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(

            drawer: Drawer(),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.blueAccent,
                showSelectedLabels: true,
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                selectedIconTheme:
                const IconThemeData(color: Colors.blueAccent),
                currentIndex: HomeScreenCubit.get(context).currentTapIndex,
                onTap: (index) {
                  HomeScreenCubit.get(context).changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book), label: 'Books'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            appBar: AppBar(
              surfaceTintColor: Colors.blue.withOpacity(.5),
              title: Text('Welcome Back User'),
            ),
            body:HomeScreenCubit.get(context)
                .tabs[HomeScreenCubit.get(context).currentTapIndex]);

        },
      ),
    );
  }
}
