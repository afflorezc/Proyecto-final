import 'package:flutter/material.dart';
import 'basic_data.dart';
import '../sample_feature/sample_item_list_view.dart';
import 'welcome_page.dart';
import 'package:power_bike/src/definitions/enumerations.dart';
import 'package:power_bike/src/storage/personal_data.dart';

class SurveyData with ChangeNotifier{

  SurveyData({
    required this.personalData,
  });

  final PersonalDataStorage personalData;
  UnitSystem units = UnitSystem.international;
  bool infoGathered = false;
  bool buttonPressed = false;
  int index = 0;
  String buttonLabel = '';
  Widget currentPage = const WelcomePage();
  List dataList = [];

  String setInitialRoute(){
    personalData.route();
    return personalData.getInitialRoute();
  }

  void setUnitSystem(UnitSystem units){
    this.units = units;
  }

  void personalInfoGathered(){

    String name = personalData.profileData.name;
    String age = '$personalData.profileData.age';
    String height = '$personalData.profileData.height';
    String weight = '$personalData.profileData.weight';

    if(name == '' || age == '' || height == '' || weight == ''){

      infoGathered = false;
    }
    else{

      infoGathered = true;
    }
  }

  void setProfileInfo(String name, int age, double height, double weight){

    personalData.profileData.setData(name, age, height, weight, units);

  }

  void next(){

    buttonPressed = true;
    switch (index){

      case 0:      
        index++;
        setPage();
        break;

      case 1:
        
        
        
                
        break;
      default:
           
    }

    notifyListeners();

  }

  void setPage(){

    switch (index){
      case 0:
        buttonLabel = 'INICIAR';
        currentPage = const WelcomePage();
        break;
      case 1:
        buttonLabel = 'Continuar';
        currentPage = const BasicData();
        break;
      default:
        currentPage = const SampleItemListView();
        break;    
    }

    notifyListeners();

  }







}