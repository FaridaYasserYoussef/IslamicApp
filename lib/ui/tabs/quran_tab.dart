import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/common/app_colors.dart';
import 'package:islamic_app/common/app_images.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/ui/screens/sura_screen.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> suras =[
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  List<int> versesCount = [];

  @override
  Widget build(BuildContext context) {
    // if(virsesCount.length == 0){
    //   getVirsesCount();
    // }
    return FutureBuilder<void>(
      future: getVirsesCount(),
      builder: (context, snapshot) {
        if(snapshot.hasData == false){
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
              child: Image(image: AssetImage(AppImages.quranHeaderIcon),
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
                  // if (index == 0){
                  //   return Column(children: [
                  //     ListTile(
                  //       title: Padding(
                  //         padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * (40/873)),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Center(child: Text("إسم السورة", style: Theme.of(context).textTheme.titleLarge,)),
                  //             Center(child: Text("عدد الأيات", style: Theme.of(context).textTheme.titleLarge,)),
                  //
                  //           ],),
                  //       ),
                  //     )
                  //   ],
                  // );
                  // }
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SuraScreen.routeName,
                      arguments: SuraModel(name: suras[index], order: index + 1)
                      );
                    },
                    child: ListTile(
                      trailing: IconButton(onPressed: (){
                        Navigator.pushNamed(context, SuraScreen.routeName,
                            arguments: SuraModel(name: suras[index], order: index + 1)
                        );
                      }, icon: Icon(Icons.arrow_forward_ios_sharp, color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.white,),),
                      leading: ImageIcon(
                        AssetImage(AppImages.suraItemIcon),
                        color: Theme.of(context).brightness == Brightness.light? AppColors.mainColorLight : AppColors.goldColor,
                        size: 50,
                      ),
                      subtitle:Text("عدد الأيات: " + versesCount[index].toString() , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).brightness == Brightness.light? AppColors.mainColorLight : AppColors.goldColor, fontWeight: FontWeight.bold),),

                        title:Text( "سورة " + suras[index] ,style: Theme.of(context).textTheme.headlineSmall),),
                  );
                },
                itemCount: suras.length ,
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

  Future<List<int>> getVirsesCount() async{
    List<int> _virsesCount =[];
    for(int i = 1; i <= suras.length; i++){
     String data =  await rootBundle.loadString("assets/quran/$i.txt");
     List<String> virsesList = data.trim().split("\n");
     _virsesCount.add(virsesList.length);
    }
setState(() {
  versesCount = _virsesCount;
});
    return _virsesCount;
  }
}
