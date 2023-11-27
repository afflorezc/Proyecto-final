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
          GridStats(),
          Padding(padding: EdgeInsets.all(10.0)),
          Center(
            child: Text("Tiempo: 00:00"),
          ),
          IconButton(
            icon: Icon(Icons.play_circle),
            onPressed: (){}, 
          ),
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

class GridStats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,

      children: <Widget>[
        ListTile(
          leading: Icon(Icons.monitor_heart),
          title: Text("120"),
        ),

        ListTile(
          leading:Icon(Icons.local_fire_department),
          title: Text("200 W"),
        ),

        ListTile(
          leading:Icon(Icons.bike_scooter),
          title: Text("92"),
        ),

        ListTile(
          leading:Icon(Icons.incomplete_circle),
          title: Text("30 km/h"),
        ),
      ],
    );
  }
}