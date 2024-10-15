import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_themes.dart';
import 'package:islamic_app/controllers/sharedPreferences.dart';
import 'package:islamic_app/providers/SebhaProvider.dart';
import 'package:islamic_app/providers/ThemeProvider.dart';
import 'package:islamic_app/ui/screens/hadeeth_screen.dart';
import 'package:islamic_app/ui/screens/home_page.dart';
import 'package:islamic_app/ui/screens/splash_screen.dart';
import 'package:islamic_app/ui/screens/sura_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    String locale = await SharedPreferncesController.getLocale() ?? "en";
    bool isDark = await SharedPreferncesController.getIsDark() ?? false;
    ThemeProvider().setLocale(locale);
    ThemeProvider().changeThemeMode(isDark == true? ThemeMode.dark : ThemeMode.light);


  runApp(MultiProvider(
    providers: [
ChangeNotifierProvider(create: (_) => ThemeProvider()),
ChangeNotifierProvider(create: (_) => SebhaProvider())
    ],
      child: MyApp(locale: locale, isDark: isDark,)));
}

class MyApp extends StatelessWidget {
  String locale;
  bool isDark;
     MyApp({required this.locale, required this.isDark, super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      locale: Locale(Provider.of<ThemeProvider>(context).getLocale),
       localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        HomePage.routeName: (_) => HomePage(),
        SuraScreen.routeName: (_) => SuraScreen(),
        HadeethScreen.routeName: (_)=>HadeethScreen()

      },

    );
  }
}

