import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/common/app_colors.dart';
import 'package:islamic_app/models/sura_model.dart';

import '../../common/app_images.dart';

class SuraScreen extends StatefulWidget {
  static const routeName = "suraDetailsScreen";

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> suraVerses = [];

  @override
  Widget build(BuildContext context) {

    SuraModel suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(suraVerses.isEmpty){
      readSuraVirses(suraModel.order);
    }
    return Container(
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
      body: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *(75/873),
          horizontal: MediaQuery.of(context).size.width *(30/412)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.light? AppColors.mainColorLight : AppColors.goldColor
            ),
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: Text(suraModel.name, style: Theme.of(context).textTheme.titleLarge,),
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width *(50/412),
                  endIndent: MediaQuery.of(context).size.width *(50/412),
                ),
  suraVerses.length == 0 ? Center(
    child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ),
  ) : Expanded(child: Directionality(
    textDirection: TextDirection.rtl,
    child: ListView.builder(itemCount: suraVerses.length, itemBuilder: (context, index){
    return Center(child: RichText(text: TextSpan(text: suraVerses[index], style: TextStyle(color: Theme.of(context).brightness == Brightness.light? AppColors.blackColor : Colors.white), children: [
      TextSpan(text: "\uFD3F" + "${index +1}" + "\uFD3E", style: TextStyle(color:  Theme.of(context).brightness == Brightness.light? AppColors.mainColorLight : AppColors.goldColor))
    ]),) );
} ),
  ))

              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Future<void> readSuraVirses(int order) async{
    String data = await rootBundle.loadString("assets/quran/$order.txt");
    List<String> _suraVerses = data.trim().split("\n");
    print("verses ${_suraVerses}");
    _suraVerses.removeWhere((element) => element.isEmpty);
    setState(() {
      suraVerses = _suraVerses;
    });
  }
}
