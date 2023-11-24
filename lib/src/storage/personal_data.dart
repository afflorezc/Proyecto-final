import 'package:power_bike/src/definitions/enumerations.dart';

import 'data_storage.dart';
import '../definitions/profile_data.dart';


class PersonalDataStorage {
  PersonalDataStorage({required this.id});
  final int id;
  String initRoute = '';
  DataStorage personalData = DataStorage(fileName:'personal_data.txt');
  ProfileData profileData =  ProfileData();

  Future<bool> fileExist() async{
    return personalData.isFile();
  }

  Future<void> route() async {
    bool exist = await fileExist();
    if(exist){
      initRoute = '/menu';
    }
    else{
      initRoute = '/welcome';
    }
  }

  String getInitialRoute() => initRoute;

  void saveFile(UnitSystem units) async {

    profileData.saveData(units);
    double height = profileData.height;
    double weight = profileData.weight;
    if(units == UnitSystem.imperial) {
      height = convertHeight(height, units);
      weight = convertWeight(weight, units);
    }
    String text = 'DATOS PERSONALES';
    personalData.writeLine(text);
    text = 'Nombre: ${profileData.name}';

    personalData.writeLine(text);
    text = 'Género : ${profileData.getGender()}';
    personalData.writeLine(text);
    text = 'Edad: ${profileData.age} años';
    personalData.writeLine(text);
    text = 'Estatura: ${profileData.height} cm';
    personalData.writeLine(text);
    text = 'Peso: ${profileData.weight} kg';
    personalData.writeLine(text);
    text = 'Frecuencia cardiaca máxima: ${profileData.maximumBpm}';
    personalData.writeLine(text);
    text = 'Indice de masa corporal: ${profileData.massIndex}';
    personalData.writeLine(text);

  }

}