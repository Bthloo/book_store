import 'package:book_store/Core/Component/search.dart';
import 'package:book_store/Features/Auth/View/Pages/login_screen.dart';
import 'package:book_store/Features/Check%20out%20Screem/View/Pages/checkout_screen.dart';
import 'package:flutter/material.dart';

import 'Features/Auth/View/Pages/register_screen.dart';
import 'Features/Auth/View/Pages/verify_email.dart';
import 'Features/Book Details Screen/View/Pages/book_details.dart';
import 'Features/Home Screen/View/Pages/home_screen.dart';
import 'Features/onboarding/View/Pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:const MaterialStatePropertyAll(
                Colors.black
            ),
            foregroundColor: const MaterialStatePropertyAll(
                Colors.white
            ),
            overlayColor: MaterialStatePropertyAll(
              Colors.grey.shade800
            )
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        OnBoarding.routeName : (_) => OnBoarding(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        OtpScreen.routeName : (_) => OtpScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        BookDetails.routeName : (_) => BookDetails(),
        SearchProduct.routeName : (_) => SearchProduct(),
        CheckoutScreen.routeName : (_) => CheckoutScreen(),
      },
    );
  }
}

