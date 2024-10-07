
import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_images.dart';
import 'package:islamic_app/ui/tabs/hadeeth_tab.dart';
import 'package:islamic_app/ui/tabs/quran_tab.dart';
import 'package:islamic_app/ui/tabs/radio_tab.dart';
import 'package:islamic_app/ui/tabs/sebha_tab.dart';
import 'package:islamic_app/ui/tabs/settings_tab.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
List<Widget> tabs = [
  QuranTab(),
  SebhaTab(),
  HadeethTab(),
  RadioTab(),
  SettingsTab()
];
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Theme.of(context).brightness == Brightness.light? AppImages.lightBackgroundImage: AppImages.darkBackgroundImage),
        fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("إسلامي",
          style: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        body: tabs[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value){
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.quranIcon)), label: "القرأن"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.sebhaIcon)), label: "السبحة"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.hadeethIcon)), label: "الحديث"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.radioIcon)), label: "الراديو"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الإعدادات"),
          ],
        ),
      ),
    );
  }
}
