import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_colors.dart';

class AppThemes{
static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,)),
  dividerTheme: DividerThemeData(
    color: AppColors.mainColorLight
  ),
  primaryColor: AppColors.mainColorLight,
    canvasColor: AppColors.mainColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.mainColorLight,
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: Colors.white,
    ),
  colorScheme: ColorScheme(
    primary: AppColors.mainColorLight,
      brightness: Brightness.light,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.blackColor,
      onSecondary: AppColors.blackColor,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: AppColors.blackColor,
      surface:AppColors.blackColor,
      onSurface: AppColors.blackColor
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent
  )
);
static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
        backgroundColor: Colors.transparent
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
        titleLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
        headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white)),
    dividerTheme: DividerThemeData(
        color: AppColors.mainColorDark
    ),
    primaryColor: AppColors.mainColorDark,
    canvasColor: AppColors.mainColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.mainColorDark,
        selectedItemColor: AppColors.goldColor,
        unselectedItemColor: Colors.white
  ),
  colorScheme: ColorScheme(
      primary: AppColors.mainColorDark,
      brightness: Brightness.dark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white
  )
);

}