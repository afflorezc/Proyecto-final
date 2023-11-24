import 'package:flutter/material.dart';
import 'package:power_bike/src/menu/menu.dart';
import 'package:provider/provider.dart';
import 'survey_data_controller.dart';


/// Pantalla inicial de bienvenida cuando se hace un primer uso de la aplicación
/// Da inicio a la caracterización inicial. Si esta página se muestra, la serie
/// de "pantallas" de caracterización se deben ejecutar antes de entrar en la
/// pantalla principal de la aplicación

class InitSurvey extends StatelessWidget{

  const InitSurvey({ 
    super.key, 
    required this.surveyDataController,
  });

  static const routeName = '/welcome';
  final SurveyDataController surveyDataController;

  @ override
  Widget build(BuildContext context){
        
    return ChangeNotifierProvider(
      create: (context) => surveyDataController,
      child: const SurveyLayout(),  
    );
  }
}

class SurveyLayout extends StatelessWidget {
  
  const SurveyLayout({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {

    var surveyDataState = context.watch<SurveyDataController>();
    
    return Scaffold(
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
              child: surveyDataState.currentPage,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            ElevatedButton(
              child: Text(surveyDataState.buttonLabel),
              onPressed: () {
                if (surveyDataState.index == 2) {
                  Navigator.restorablePushNamed(context, MainMenu.routeName);
                }
                surveyDataState.next(context);

              },
            ),
          ],
        ),
    );
  }
}
