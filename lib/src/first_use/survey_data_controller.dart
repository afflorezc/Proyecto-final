import 'package:flutter/material.dart';
import 'basic_data.dart';
import 'experience_data.dart';
import '../sample_feature/sample_item_list_view.dart';
import 'welcome_page.dart';
import 'package:power_bike/src/definitions/enumerations.dart';
import 'package:power_bike/src/storage/personal_data.dart';

class SurveyDataController extends ChangeNotifier{

  final PersonalDataStorage personalData =  PersonalDataStorage(id:0);
  
  void initialize(){
    personalData.route();
  }

  UnitSystem units = UnitSystem.international;

  bool infoGathered = false;
  bool buttonPressed = false;

  int index = 0;

  String buttonLabel = 'INICIAR';
  String labelWeight ='kg';
  String labelHeight = 'cm';
  String labelGender = 'Masculino';

  Widget currentPage = const WelcomePage();
  List dataList = [];

  String getInitialRoute(){
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

void changeGender(){

  switch(personalData.profileData.gender){

    case Gender.male:
      personalData.profileData.gender = Gender.female;
      labelGender = 'Femenino';
      break;

    case Gender.female:
      personalData.profileData.gender = Gender.undefined;
      labelGender = 'No responde';
      break;

    default:
      personalData.profileData.gender = Gender.male;
      labelGender = 'Masculino';
      break;    
  }

  notifyListeners();

}

  void next(BuildContext context){

    buttonPressed = true;
    switch (index){

      case 0:      
        index++;
        setPage();
        buttonPressed = false;
        break;

      case 1:
        
        personalInfoGathered();
        if(infoGathered){
          index++;
          personalData.saveFile(units);
          setPage();
        }
        else{

            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error en ingreso de datos'),
                  content: const Text(
                      'Por favor ingrese todos los datos completos para poder continuar'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              }  
            );    
        }
              
        break;
      default:
           
    }

    notifyListeners();

  }

  void setPage(){

    switch (index){
      
      case 1:
        buttonLabel = 'Continuar';
        currentPage =  BasicData(surveyDataController: this,);
        break;

      case 2:
        buttonLabel = 'Continuar';
        currentPage = ExperienceData(surveyDataController: this,);
        break;
          
      default:
        currentPage = const SampleItemListView();
        break;    
    }

  }

  void setLabel(){

    switch(units){
      case UnitSystem.international:
         labelWeight ='kg';
         labelHeight = 'cm';
      case UnitSystem.imperial:
        labelWeight ='lb';
        labelHeight = 'ft';
      default:
        labelWeight = 'kg'; 
        labelHeight = 'cm';    
    }
  }

  void changeUnitsBtn(){

    units = swapUnits(units);
    double weight = personalData.profileData.weight;
    double height = personalData.profileData.height;
    personalData.profileData.weight = convertWeight(weight, units);
    personalData.profileData.height = convertHeight(height, units);
    setLabel();    

    notifyListeners();             
  }

  void increaseWeight(){

    personalData.profileData.weight += 1.0;

    notifyListeners();
  }

  void decreaseWeight(){

    personalData.profileData.weight -= 1.0;

    notifyListeners();
  }

  void increaseAge(){

    personalData.profileData.age +=1;

    notifyListeners();

  }

  void decreaseAge(){

    personalData.profileData.age -=1;

    notifyListeners();

  }

  void increaseHeight(){
    
    switch(units){

      case UnitSystem.international:
        personalData.profileData.height += 1.0;
      case UnitSystem.imperial:
        personalData.profileData.height += 0.08;
      default:
        personalData.profileData.height +=1.0;    
    }

    notifyListeners();
  }

  void decreaseHeight(){
    
    switch(units){

      case UnitSystem.international:
        personalData.profileData.height -= 1.0;
      case UnitSystem.imperial:
        personalData.profileData.height -= 0.08;
      default:
        personalData.profileData.height -=1.0;    
    }

    notifyListeners();
  }







}