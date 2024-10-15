import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamic_app/common/app_colors.dart';
import 'package:islamic_app/common/app_images.dart';
import 'package:islamic_app/providers/SebhaProvider.dart';
import 'package:provider/provider.dart';
class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SebhaProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Transform.rotate(angle: provider.getSebhaRotationAngle,
          child:
          GestureDetector(
            onTap: (){
              
              int newCount = provider.getTasbeehCount + 1;
              if(newCount <= 33){
                double newangle = provider.getSebhaRotationAngle + (11 * (pi /180));
              provider.setSebhaRotationAngle(newangle);
                provider.setTasbeehCount(newCount);
              }
              else{
                provider.setTasbeehCount(0);
                provider.setCurrentTasbeehIndex(provider.getCurrentTasbeehIndex + 1);
              }

            },
            
            child: Image(image: Theme.of(context).brightness == Brightness.dark? AssetImage(AppImages.sebhaHeaderIconDark): AssetImage(AppImages.sebhaHeaderIconLight)))
          ,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.05),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight, 
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(provider.getListOFTasbeeh[provider.getCurrentTasbeehIndex], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                    ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.03) ,
                    decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight, 
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(provider.getTasbeehCount.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                    ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.goldColor: AppColors.mainColorLight, 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){
                        provider.setSebhaRotationAngle(0);
                        provider.setCurrentTasbeehIndex(0);
                        provider.setTasbeehCount(0);
                      },
                      child: Text("Reset", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),)
                    
                    )
              ],
            ),
          ))

      ],
    );
  }
}
