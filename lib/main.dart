import 'package:flutter/material.dart';

import 'package:flutter_shop_app/splash_screen.dart';
import 'package:flutter_shop_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: customTheme,
        title: 'ShopApp',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
