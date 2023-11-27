import 'package:flutter/material.dart';


class Workout extends StatelessWidget{
  const Workout({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          GridGraficos(),
          Padding(padding: EdgeInsets.all(10.0)),
          GridGraficos(),
          Padding(padding: EdgeInsets.all(10.0)),

        ],
      ),
    );
  }
}

class GridGraficos extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: const <Widget>[
        Text("prueba"),
        Text("prueba"),
        Text("prueba"),
        Text("prueba"),
      ],
    );
    
  }

}