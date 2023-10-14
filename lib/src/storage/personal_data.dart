import 'data_storage.dart';


class PersonalDataStorage {
  PersonalDataStorage({required this.id});
  final int id;
  String initRoute = '';
  DataStorage personalData = DataStorage(fileName:'personal_data.txt');

  Future<bool> fileExist() async{
    return personalData.isFile();
  }

  Future<void> route() async {
    bool exist = await fileExist();
    if(exist){
      initRoute = '/';
    }
    else{
      initRoute = '/bienvenida';
    }
  }

}