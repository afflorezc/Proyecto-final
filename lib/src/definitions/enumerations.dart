enum Gender {male, female, undefined}
enum UnitSystem {international, imperial}
enum Expertise {amateur, intermediate, advance, profesional, elite}

UnitSystem swapUnits(UnitSystem units){
  switch(units){
    case UnitSystem.international:
       units = UnitSystem.imperial;
    case UnitSystem.imperial:
       units = UnitSystem.international;
    default:
       units = units;      
  }
  return units;
}

double convertWeight(double weight, UnitSystem units){
  double conversionFactor =0.0;
  double convertedWeight;
 
  switch(units){
    
    case UnitSystem.international:
      conversionFactor = 0.453592;
      break;
    case UnitSystem.imperial:
      conversionFactor = 2.20462;  
      break; 
    default:
      conversionFactor = 1.0;   
      break;
  }

  convertedWeight = conversionFactor*weight;
  String valWeight = convertedWeight.toStringAsFixed(0);
  convertedWeight = double.parse(valWeight);
  return(convertedWeight);
}

double convertHeight(double height, UnitSystem units){
  double conversionFactor =0.0;
  double convertedHeight;
  int digits = 0;
 
  switch(units){
    
    case UnitSystem.international:
      conversionFactor = 0.3048*100;
      break;
    case UnitSystem.imperial:
      conversionFactor = 3.28084/100; 
      digits = 2;   
      break;
    default:
      conversionFactor = 1.0;   
      break;
  }

  convertedHeight = conversionFactor*height;
  String valWeight = convertedHeight.toStringAsFixed(digits);
  convertedHeight = double.parse(valWeight);
  return(convertedHeight);
}