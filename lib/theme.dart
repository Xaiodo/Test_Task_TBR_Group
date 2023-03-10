import 'package:flutter/material.dart';

final blueGreyColor = const Color(0xffF4F5FF).withOpacity(0.4);
const inactiveButtonColor = Color(0xff7886B8);

final floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: blueGreyColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  foregroundColor: inactiveButtonColor,
  elevation: 0,
);

final outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: const BorderSide(
    width: 0,
    color: Colors.transparent,
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: const Color(0xffF4F5FF).withOpacity(0.4),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  hintStyle: const TextStyle(
    color: Color(0xff594C74),
  ),
);

final theme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: const Color(0xff8EAAFB),
  inputDecorationTheme: inputDecorationTheme,
  floatingActionButtonTheme: floatingActionButtonTheme,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.0,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff594C74),
    ),
    titleLarge: TextStyle(
      fontSize: 32,
      height: 20 / 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
);
