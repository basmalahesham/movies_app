import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryColor = Color.fromRGBO(18, 19, 18, 1.0);
  static ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(26, 26, 26, 1.0),
      unselectedItemColor: Colors.white,
      selectedItemColor: Color.fromRGBO(255, 187, 59, 1.0),
      selectedIconTheme: IconThemeData(
        color: Color.fromRGBO(255, 187, 59, 1.0),
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 25,
      ),
    ),
  );
}
