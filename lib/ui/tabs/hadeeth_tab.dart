import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/models/hadeeth_model.dart';
import 'package:islamic_app/ui/screens/hadeeth_screen.dart';

import '../../common/app_colors.dart';
import '../../common/app_images.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<String> hadeethNames = [];
  List<String> hadeethContent = [];
  late Future<List<String>> futureHadeethNames;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureHadeethNames = getHadeethNamesAndContent();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: futureHadeethNames,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }

          return Stack(
            children: [
              Column(children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (70/873),
                    bottom: MediaQuery.of(context).size.height * (35/873)
                ),
                  child: Image(image: AssetImage(AppImages.hadeethHeaderIcon),
                    height: MediaQuery.of(context).size.height * (227/873),
                    width: MediaQuery.of(context).size.width * (205/412) ,
                  ),
                ),
                Divider(thickness: 4),


                Expanded(
                    flex: 10,
                    child:  Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.separated(
                          itemBuilder: (context, index){

                            return GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, HadeethScreen.routeName,
                                    arguments: HadeethModel(name: hadeethNames[index], content: hadeethContent)
                                );
                              },
                              child: ListTile(
                                trailing: IconButton(onPressed: (){
                                  Navigator.pushNamed(context, HadeethScreen.routeName,
                                      arguments: HadeethModel(name: hadeethNames[index], content: hadeethContent)
                                  );
                                }, icon: Icon(Icons.arrow_forward_ios_sharp, color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.white,),),
                                leading: ImageIcon(
                                  AssetImage(AppImages.hadeethItemIcon),
                                  color: Theme.of(context).brightness == Brightness.light? AppColors.mainColorLight : AppColors.goldColor,
                                  size: 50,
                                ),

                                title:Text(  hadeethNames[index] ,style: Theme.of(context).textTheme.headlineSmall),),
                            );
                          },
                          itemCount: hadeethNames.length ,
                          separatorBuilder: (BuildContext context, int index){
                            // if(index == 0){
                            //   return Divider(
                            //     thickness: 4,);
                            // }
                            return Divider(
                              thickness: 2,);
                          },)))
              ],),
              // Align(alignment: Alignment.center,child: VerticalDivider(thickness: 4, indent: MediaQuery.of(context).size.height * (340/873),))
            ],
          );
        }
    );
  }

  Future<List<String>> getHadeethNamesAndContent() async {
    List<String> _hadeethNames = [];
    List<String> _hadeethContent = [];
    String data = await rootBundle.loadString("assets/hadeeth/ahadeth.txt");
    List<String> ahadeeth = data.trim().split("#");
    ahadeeth.removeWhere((element) => element.isEmpty);
    for(String hadeeth in ahadeeth){
      hadeeth = hadeeth.trim();
      int firstLineBreakIndex = hadeeth.indexOf("\n");
      if (firstLineBreakIndex == -1) {
            continue;
           }
          _hadeethNames.add(hadeeth.substring(0, firstLineBreakIndex));
          _hadeethContent.add(hadeeth.substring(firstLineBreakIndex + 1));
    }
    print("exited loop");

      setState(() {
        hadeethNames = _hadeethNames;
        hadeethContent = _hadeethContent;
      });
      return _hadeethNames;
  }

}
