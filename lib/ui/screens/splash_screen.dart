import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_images.dart';
import 'package:islamic_app/ui/screens/home_page.dart';
class SplashScreen extends StatelessWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Theme.of(context).brightness == Brightness.light? AppImages.lightSplashScreen : AppImages.darkSplashScreen))
      ),
      child: Scaffold(backgroundColor: Colors.transparent,),
    );
  }
}
