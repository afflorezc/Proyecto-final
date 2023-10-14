import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context){
    return const Column(
      children: <Widget>[
        Card(
        child:  ListTile(
          leading: Icon(Icons.directions_bike),
          title: Text('BIENVENIDO!'),
          subtitle: Text('¡LLeve su entrenamiento de ciclismo a un nuevo nivel!'),
          ),
        ),
        Card(
          child:  ListTile(
            leading: Icon(Icons.directions_bike_outlined),
            title: Text('Controle y mejore su técnica de pedaleo'),
            subtitle: Text('Seguimiento de cadencia y ciclo de pedaleo. Logre el'
                           ' anhelado pedaleo redondo'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.directions_bike_rounded),
            title: Text('Programe sus entrenamientos'),
            subtitle: Text('Totalmente personalizado y adaptado a sus necesidades'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Mantenga un registro de su avance'),
            subtitle: Text('Aplique las diversas pruebas de rendimiento estandarizadas'),
          ),
        ),
        
     ],
    );
  }

}