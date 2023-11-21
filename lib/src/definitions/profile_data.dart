import '../definitions/enumerations.dart';

class ProfileData {

  String name = '';
  int age = 20;
  double height = 160.0;
  double weight = 50.0;
  Gender gender = Gender.male;
  int maximumBpm = 0;
  double massIndex = 0.0;

  void setData(String name, int age, double height, double weight, UnitSystem units){

    this.name = name;
    this.age = age;
    this.height = height;
    this.weight = weight;
    setMassIndex(units);
    setMaxBpm();
  }

  void setName(String name){
    this.name = name;
  }

  void setMaxBpm(){

    switch (gender){
      case Gender.male:
        maximumBpm = 220 - age;
        break;
      case Gender.female:
        maximumBpm = 226 - age;
        break;
      case Gender.undefined:
        maximumBpm = 220 - age;
        break;
      default:
        maximumBpm = 0;
        break;       
    }
  }

  setMassIndex(UnitSystem units){
    
    if(units == UnitSystem.imperial){
      height = 0.3048*height;
      weight = 0.4536*weight;
    }
    double heightToCalc = height/100;
    massIndex = weight/(height*heightToCalc);
  }

  void saveData(UnitSystem units){

    setMassIndex(units);
    setMaxBpm();

  }

  String getGender() {

    switch(gender) {

      case Gender.male:
        return 'Masculino';
      case Gender.female:
        return 'Femenino';
      default:
        return 'No responde';    
    }
  }

}