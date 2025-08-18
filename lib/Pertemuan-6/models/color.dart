import 'package:flutter/material.dart';

Color primary = Color.fromRGBO(57, 70, 117, 1);

Color neutral = Color.fromRGBO(24, 14, 37, 1);

Color lightgrey = Color.fromRGBO(239, 238, 240, 1);
Color darkgrey = Color.fromRGBO(130, 125, 137, 1);

ThemeData themecolor() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primary)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primary,
    ),
  );
}
