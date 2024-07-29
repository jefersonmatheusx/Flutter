import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.orangeAccent;
const COLOR_ACCENT = Colors.orange;
const TextTheme TEXT_THEME = TextTheme(
    titleMedium: TextStyle(
      fontFamily: 'OpenSans',
      // fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontFamily: 'OpenSans',
      // fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontFamily: 'OpenSans',
      // fontSize: 22,
      fontWeight: FontWeight.bold,
    ));

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_ACCENT,
    appBarTheme: AppBarTheme(backgroundColor: COLOR_ACCENT),
    textTheme: TEXT_THEME,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: COLOR_ACCENT),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
        backgroundColor: WidgetStateProperty.all<Color>(COLOR_PRIMARY),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    colorScheme: const ColorScheme(
      primary: COLOR_ACCENT,
      onPrimary: Colors.white,
      secondary: COLOR_ACCENT,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TEXT_THEME,
);
