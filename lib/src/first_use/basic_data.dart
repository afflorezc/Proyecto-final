import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_bike/src/first_use/survey_data_controller.dart';

/// Pantalla inicial de caracterización: Preguntas personales iniciales
/// Nombre, genero, edad (fecha de nacimiento), Estatura (en cm/ft), Peso en (kg/lb)

class BasicData extends StatelessWidget{

  const BasicData({
    super.key,
    required this.surveyDataController,
  });
  
  final SurveyDataController surveyDataController;

   @ override
  Widget build(BuildContext context){
        
    return ChangeNotifierProvider(
      create: (context) => surveyDataController,
      child: const BasicDataForm(),  
    );
  }
} 

class BasicDataForm extends StatelessWidget{

  const BasicDataForm({
    super.key,
  });

  @override
  Widget build(BuildContext context){

    var surveyDataState = context.watch<SurveyDataController>();

    return Column(
      children: [
        NameInput(surveyDataState: surveyDataState),
              
        const SizedBox(
          height: 8
        ),

        GenderInput(surveyDataState: surveyDataState),

        AgeInput(surveyDataState: surveyDataState),   

        const SizedBox(
          height: 8
        ), 

        HeightInput(surveyDataState: surveyDataState),

        const SizedBox(
          height: 8
        ),

        WeightInput(surveyDataState: surveyDataState),
      ],
    );
  }

}

class WeightInput extends StatelessWidget {
  const WeightInput({
    super.key,
    required this.surveyDataState,
  });

  final SurveyDataController surveyDataState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("Peso: ", textScaleFactor: 1.10,),
        const SizedBox(width: 8),
        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.decreaseWeight();
          },
        ),
        const SizedBox(width: 8),
        Text('${surveyDataState.personalData.profileData.weight}'),
        const SizedBox(width: 8),
        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.increaseWeight();
          },
        ),
        const SizedBox(width: 8),
        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.changeUnitsBtn();
          },
        ),
        const SizedBox(width: 8),
        Text(surveyDataState.labelWeight),
        const SizedBox(width: 8),
        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.changeUnitsBtn();
          },
        ),
      ],
    );
  }
}

class AgeInput extends StatelessWidget {
  const AgeInput({
    super.key,
    required this.surveyDataState,
  });

  final SurveyDataController surveyDataState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

        const Text("Edad: ", textScaleFactor: 1.10,),
        
        const SizedBox(width: 8),

        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.decreaseAge();
          },
        ),
        
        const SizedBox(width: 8),

        Text('${surveyDataState.personalData.profileData.age}'),

        const SizedBox(width: 8),

        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.increaseAge();
          },
        ),
      ]  
    );
  }
}

class GenderInput extends StatelessWidget {
  const GenderInput({
    super.key,
    required this.surveyDataState,
  });

  final SurveyDataController surveyDataState;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: <Widget>[

        const Text("Género: ", textScaleFactor: 1.10,),

        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.changeGender();
          },
        ),
        
        const SizedBox(width: 8),

        Text(surveyDataState.labelGender),

        const SizedBox(width: 8),

        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.changeGender();
          },
        ),  

      ]

    );
  }
}

class HeightInput extends StatelessWidget {
  const HeightInput({
    super.key,
    required this.surveyDataState,
  });

  final SurveyDataController surveyDataState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("Estatura: ", textScaleFactor: 1.10,),
        const SizedBox(width: 8),
        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.decreaseHeight();
          },
        ),
        const SizedBox(width: 8),
        Text('${surveyDataState.personalData.profileData.height}'),
        const SizedBox(width: 8),
        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.increaseHeight();
          },
        ),
        const SizedBox(width: 8),
        TextButton(
          child: const Text("<"),
          onPressed: () {
            surveyDataState.changeUnitsBtn();
          },
        ),
        const SizedBox(width: 8),
        Text(surveyDataState.labelHeight),
        const SizedBox(width: 8),
        TextButton(
          child: const Text(">"),
          onPressed: () {
            surveyDataState.changeUnitsBtn();
          },
        ),
      ],
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required this.surveyDataState,
  });

  final SurveyDataController surveyDataState;

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: <Widget>[
        const Text("Nombre: ", textScaleFactor: 1.1, ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            onChanged: (String nameValue){
              surveyDataState.personalData.profileData.setName(nameValue);
            },
            decoration: const InputDecoration(  
              border: OutlineInputBorder(),
              hintText: "Ingrese su nombre",
            ),
          ),
        ),
      ],
    );
  }
}