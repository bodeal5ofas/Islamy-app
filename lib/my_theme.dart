import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color.fromARGB(255, 209, 107, 70);
  static Color primaryDark = Color(0xff141A2E);
  static Color blackColor = Colors.black;
  static Color whiteColor = Colors.white;
  static Color yellowColor = Colors.yellow;
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, centerTitle: true, elevation: 0),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: MyTheme.primaryLight,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: whiteColor,
      selectedItemColor: blackColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: yellowColor,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: whiteColor,
      selectedItemColor: yellowColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
  );
}
