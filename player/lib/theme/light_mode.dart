import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFFFFFFF), // white background
  primaryColor: Color(0xFF12279E), // deep blue
  colorScheme: ColorScheme.light(
    primary: Color(0xFF12279E),
    secondary: Colors.grey,
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF0F0F0),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);
