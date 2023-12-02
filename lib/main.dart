import 'package:flutter/material.dart';

import 'package:flutter_shop_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(255, 232, 59, 1),
              primary: Color.fromRGBO(255, 232, 59, 1),
              secondary: Color.fromRGBO(216, 213, 192, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
        title: 'ShopApp',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
