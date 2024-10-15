import 'package:flutter/widgets.dart';

class SebhaProvider with ChangeNotifier{
  int tasbeehCount = 0;
  int get getTasbeehCount => tasbeehCount;
  int currentTasbeehIndex = 0;
  int get getCurrentTasbeehIndex => currentTasbeehIndex;
  List<String> listOFTasbeeh = ["سبحان الله", "الحمد لله", "الله أكبر", "لا إله إلا الله"];
  List<String> get getListOFTasbeeh => listOFTasbeeh;
  double sebhaRotationAngle = 0;
  double get getSebhaRotationAngle => sebhaRotationAngle;

  
  void setTasbeehCount(int newCount){
    tasbeehCount = newCount;
    notifyListeners();
  }
  void setCurrentTasbeehIndex(int newCurrentTasbeehIndex){
    if(newCurrentTasbeehIndex > (listOFTasbeeh.length -1)){
      newCurrentTasbeehIndex = 0;
    }
    currentTasbeehIndex = newCurrentTasbeehIndex;
    notifyListeners();

  }

  void setSebhaRotationAngle(double newSebhaRotationAngle){
    sebhaRotationAngle = newSebhaRotationAngle;
    notifyListeners();
  }

}