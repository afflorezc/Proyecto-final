import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

/// Pantalla inicial de bienvenida cuando se hace un primer uso de la aplicación
/// Da inicio a la caracterización inicial. Si esta página se muestra, la serie
/// de "pantallas" de caracterización se deben ejecutar antes de entrar en la
/// pantalla principal de la aplicación

class MainMenu extends StatelessWidget{

  const MainMenu({ 
    super.key, 
  });

  static const routeName = '/menu';

  @ override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
           IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
           )
        ],
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 220),
              child: const Image(
                image: AssetImage('assets/images/logo_ia2.png'), 
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: const MenuButtons(),
            ),

       
            
          ],
        ),
    );
  }
}

class MenuButtons extends StatelessWidget{
  const MenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.fitness_center),
              onPressed: (){
                Navigator.restorablePushNamed(context, MainMenu.routeName);
              },
            ),
            const SizedBox(width: 8),
            const Text("Entrenar"),
          ],
        ),

        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.drive_file_rename_outline_sharp),
              onPressed: (){
                Navigator.restorablePushNamed(context, MainMenu.routeName);
              },
            ),
            const SizedBox(width: 8),
            const Text("Test"),
          ],
        ),

        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.lightbulb),
              onPressed: (){
                Navigator.restorablePushNamed(context, MainMenu.routeName);
              },
            ),
            const SizedBox(width: 8),
            const Text("Fundamentos"),
          ],
        ),

      ],
    );
  }

}

