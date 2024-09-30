import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_colors.dart';

class AppThemes{
static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: TextTheme(
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: AppColors.blackColor,)),
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
static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
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