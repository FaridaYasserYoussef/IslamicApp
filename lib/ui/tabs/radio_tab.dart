import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_colors.dart';
import 'package:islamic_app/common/app_images.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25, left:  MediaQuery.of(context).size.width*0.05),
          child: Image(image: AssetImage(AppImages.radioHeaderIcon)),
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous, color: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight, size: 50,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,  color: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight,size: 50,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,  color: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight, size: 50,)),


        ],))
    ],);
  }
}
