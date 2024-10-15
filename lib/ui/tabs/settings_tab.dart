import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_colors.dart';
import 'package:islamic_app/controllers/sharedPreferences.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/providers/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<ThemeProvider>(context);

    return  Column(
      children: [
        SwitchListTile(
          title: Text(S.of(context).darkMode),
            inactiveThumbColor: Colors.white,
            thumbColor: MaterialStateProperty.all<Color>(Colors.white),
            activeColor: AppColors.goldColor,
            inactiveTrackColor: Colors.grey,
            value: provider.isDark , onChanged: (val){
          if (val == false){
            provider.changeThemeMode(ThemeMode.light);

          }else{
            provider.changeThemeMode(ThemeMode.dark);
            

          }
          SharedPreferncesController.setDarkMode(val);
        }),

        ListTile(title: Text(S.of(context).language),
        trailing: DropdownButton(
          value: provider.getLocale,
          items: [
          DropdownMenuItem(
            child: Text("عربي"), value: "ar",),
          DropdownMenuItem(child: Text("English"), value: "en"),

        ],
        
        onChanged: (value){
          provider.setLocale(value!);
          SharedPreferncesController.setLocale(value);
        },
        ),
        )
      ],

    );
  }
}
