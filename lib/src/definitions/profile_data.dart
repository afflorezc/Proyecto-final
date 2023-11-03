import '../definitions/enumerations.dart';

class ProfileData {

  String name = '';
  int age = 0;
  double height = 0.0;
  double weight = 0.0;
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
    massIndex = weight/(height*height);
  }

}