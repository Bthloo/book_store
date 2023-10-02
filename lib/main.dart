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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

