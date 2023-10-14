import 'package:flutter/material.dart';
import 'basic_data.dart';
import 'welcome_page.dart';
import '../sample_feature/sample_item_list_view.dart';
import '../storage/personal_data.dart';

/// Pantalla inicial de bienvenida cuando se hace un primer uso de la aplicación
/// Da inicio a la caracterización inicial. Si esta página se muestra, la serie
/// de "pantallas" de caracterización se deben ejecutar antes de entrar en la
/// pantalla principal de la aplicación
class InitSurvey extends StatefulWidget{
  const InitSurvey({ 
    super.key, 
    required this.personalData
  });

  static const routeName = '/bienvenida';
  final PersonalDataStorage personalData;
  @override
  // ignore: no_logic_in_create_state
  State<InitSurvey> createState() => _InitSurvey(personalData: personalData);

}

class _InitSurvey extends State<InitSurvey>{

  _InitSurvey({
    required this.personalData
  });

  int index = 0;
  final PersonalDataStorage personalData;

  void nextPage(){
    setState((){ index++;});
  }

  @ override
  Widget build(BuildContext context){
    Widget page;
    switch (index){
      case 0:
        page = const WelcomePage();
        break;
      case 1:
        page = BasicData(personalData: personalData);
        break;
      default:
        return const SampleItemListView();    
    }
    return  Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 240),
              child: const Image(
                image: AssetImage('assets/images/logo_ia2.jpeg'), 
              ),        
            ),
            Container(
              child: page,
            ),
            ElevatedButton(
              child: const Text('Continuar...'),
              onPressed: () {

                nextPage();
              },
            ),
          ],
        ),
    );
  }
}
