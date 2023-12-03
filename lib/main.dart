import 'package:flutter/material.dart';
import 'package:flutter_shop_app/cart_provider.dart';

import 'package:flutter_shop_app/splash_screen.dart';
import 'package:flutter_shop_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          theme: customTheme,
          title: 'ShopApp',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
