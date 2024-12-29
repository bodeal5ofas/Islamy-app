import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  void changeLanguage(String newLanguage) {
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(String newTheme) {
    if (newTheme == 'dark') {
      appTheme = ThemeMode.dark;
    } else if (newTheme == 'light') {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}
