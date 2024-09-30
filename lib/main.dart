import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_themes.dart';
import 'package:islamic_app/ui/screens/home_page.dart';
import 'package:islamic_app/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        HomePage.routeName: (_) => HomePage()

      },

    );
  }
}

