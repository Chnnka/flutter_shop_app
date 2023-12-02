import 'package:flutter/material.dart';

final customTheme = ThemeData(
  fontFamily: 'Lato',
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(255, 232, 59, 1),
    primary: const Color.fromRGBO(255, 232, 59, 1),
    secondary: const Color.fromRGBO(216, 213, 192, 1),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  useMaterial3: true,
);
