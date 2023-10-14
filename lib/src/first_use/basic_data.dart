import 'package:flutter/material.dart';
import 'package:power_bike/src/storage/personal_data.dart';

/// Pantalla inicial de caracterización: Preguntas personales iniciales
/// Nombre, edad (fecha de nacimiento), Estatura (en cm), Peso en (kg)
class BasicData extends StatefulWidget{
  const BasicData({
    super.key,
    required this.personalData
    });

    final PersonalDataStorage personalData;

    @override
    State<BasicData> createState() => _BasicData();

}


class _BasicData extends State<BasicData>{

  final GlobalKey<FormState> _basicDataKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Form(
          key: _basicDataKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text("Nombre: "),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: const InputDecoration(  
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
              ),
            ],
          ),
        ),
      ],
    );
  }

}