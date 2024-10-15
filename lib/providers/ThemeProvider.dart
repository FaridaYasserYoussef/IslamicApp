import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  
  ThemeProvider._privateConstructor();

  static final ThemeProvider _instance = ThemeProvider._privateConstructor();

  factory ThemeProvider() {
    return _instance;
  }

   ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark? true : false;
  String locale = "en";
  String get getLocale => locale;

   void changeThemeMode(ThemeMode incomingTheme){
    themeMode = incomingTheme;
    notifyListeners();

  }
  void setLocale(String newLocale){
    locale = newLocale;
    notifyListeners();
  }
}