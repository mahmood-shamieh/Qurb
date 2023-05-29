import 'package:flutter/material.dart';

class MyTheme {
  static Color patternLogoColor = const Color(0xffefb2bf);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffeeeeee),
    primaryColor: const Color(0xff7b2869),
    hoverColor: const Color(0xff8b316d),
    hintColor: const Color(0xff9b3b72),
    cardColor: const Color(0xff6c0b7f),
    iconTheme: const IconThemeData(
      color: Color(0xffc975b6),
    ),
    shadowColor: Color(0xff000000).withOpacity(0.5),
  );
  static ThemeData darkTheme =
      ThemeData(scaffoldBackgroundColor: const Color(0xff000000));
}
