import 'package:flutter/material.dart';
import 'package:power_bike/src/definitions/enumerations.dart';

/// Pantalla inicial de caracterización: Preguntas personales iniciales
/// Nombre, edad (fecha de nacimiento), Estatura (en cm), Peso en (kg)
class BasicData extends StatefulWidget{
  const BasicData({
    super.key,
    
    });

    
    @override
    State<BasicData> createState() => _BasicData();

}


class _BasicData extends State<BasicData>{

  final GlobalKey<FormState> _basicDataKey = GlobalKey<FormState>();
  double weight = 50.0;
  double height =160.0;
  int age = 18;
  UnitSystem units = UnitSystem.international;
  String labelWeight='kg';
  String labelHeight = 'cm';
  
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

  void increaseHeight(){
    
    switch(units){

      case UnitSystem.international:
        height += 1.0;
      case UnitSystem.imperial:
        height += 0.08;
      default:
        height +=1.0;    
    }
  }

  void decreaseHeight(){
    
    switch(units){

      case UnitSystem.international:
        height -= 1.0;
      case UnitSystem.imperial:
        height -= 0.08;
      default:
        height -=1.0;    
    }
  }

  void changeUnitsBtn(){
    units = swapUnits(units);
    weight = convertWeight(weight, units);
    height = convertHeight(height, units);
    setLabel();
    setState(() {
    });                  
  }

  void saveData(){

    

  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Form(
          key: _basicDataKey,
          child: Column(
            children: <Widget>[

              const NameInput(),
              
              const SizedBox(
                height: 8
              ),

              Row(
                children: <Widget>[
                  const Text("Edad: ", textScaleFactor: 1.10,),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text("<"),
                    onPressed: () {
                      age--;
                      setState(() {
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('$age'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text(">"),
                    onPressed: () {
                      age++;
                      setState(() {
                      });
                    },
                  ),
                ]  
              ),   

              const SizedBox(
                height: 8
              ), 

               Row(
                children: <Widget>[
                  const Text("Estatura: ", textScaleFactor: 1.10,),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text("<"),
                    onPressed: () {
                      decreaseHeight();
                      setState(() {
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('$height'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text(">"),
                    onPressed: () {
                      increaseHeight();
                      setState(() {
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text("<"),
                    onPressed: () {
                      changeUnitsBtn();
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(labelHeight),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text(">"),
                    onPressed: () {
                      changeUnitsBtn();
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 8
              ),

              Row(
                children: <Widget>[
                  const Text("Peso: ", textScaleFactor: 1.10,),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text("<"),
                    onPressed: () {
                      weight -=1.0;
                      setState(() {
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('$weight'),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text(">"),
                    onPressed: () {
                      weight +=1.0;
                      setState(() {
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text("<"),
                    onPressed: () {
                      changeUnitsBtn();
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(labelWeight),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text(">"),
                    onPressed: () {
                      changeUnitsBtn();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        const Text("Nombre: ", textScaleFactor: 1.1, ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(  
              border: OutlineInputBorder(),
              hintText: "Ingrese su nombre",
            ),
            validator: (String? text){
              if(text == null || text.isEmpty){
                return 'Por favor rellene por completo los datos';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}