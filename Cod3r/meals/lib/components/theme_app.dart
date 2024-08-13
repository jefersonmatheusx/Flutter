import 'package:flutter/material.dart';

MaterialColor primaryColor = Colors.pink;
MaterialColor secondaryColor = Colors.amber;
Color bodyTextColor = Color.fromRGBO(20, 51, 51, 1);

class ThemeApp {
  final _theme = ThemeData(
    primarySwatch: primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primaryColor,
      accentColor: secondaryColor,
      brightness: Brightness.light,
      backgroundColor: primaryColor.shade50,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 20,
        color: ThemeData.light().colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
    ),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: bodyTextColor,
          ),
          bodyMedium: TextStyle(color: bodyTextColor),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w400,
          ),
        ),
  );
  ThemeData get theme => _theme;
}
