import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferncesController{



 static void setDarkMode(bool isDark)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool("isDark", isDark);

 }

  static void setLocale(String locale)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("locale", locale);

 }

 static Future<bool?> getIsDark()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     bool? isDark =   prefs.getBool("isDark");
     return isDark;


 }

  static Future<String?> getLocale()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? locale =   prefs.getString("locale");
     return locale;
 }

}