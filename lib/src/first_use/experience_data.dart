import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_bike/src/first_use/survey_data_controller.dart';

/// Pantalla inicial de caracterización: Preguntas personales iniciales
/// Nombre, genero, edad (fecha de nacimiento), Estatura (en cm/ft), Peso en (kg/lb)

class ExperienceData extends StatelessWidget{

  const ExperienceData({
    super.key,
    required this.surveyDataController,
  });
  
  final SurveyDataController surveyDataController;

   @ override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => surveyDataController,
      child: const ExperienceDataForm(),  
    );
  }
} 
class ExperienceDataForm extends StatelessWidget{

  const ExperienceDataForm({
    super.key,
  });

  @override
   Widget build(BuildContext context){

    var surveyDataState = context.watch<SurveyDataController>();

    return const Column(

      children: [
        SizedBox(
            height: 8,
        ),
        Card(
        child:  ListTile(
          leading: Icon(Icons.directions_bike),
          title: Text('TU DESEMPEÑO!'),
          subtitle: Text('Ayudanos ahora respondiendo una serie de preguntas '
              'acerca de tu experiencia previa practicando el ciclismo'),
          ),
        ),
        SizedBox(
            height: 8,
        ),
        
      ],


    );
  }  

}