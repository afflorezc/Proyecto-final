import 'data_storage.dart';
import '../definitions/profile_data.dart';


class PersonalDataStorage {
  PersonalDataStorage({required this.id});
  final int id;
  String initRoute = '';
  DataStorage personalData = DataStorage(fileName:'personal_data.txt');
  ProfileData profileData =  ProfileData();

  Future<bool> fileExist() async{
    return personalData.isFile();
  }

  Future<void> route() async {
    bool exist = await fileExist();
    if(exist){
      initRoute = '/';
    }
    else{
      initRoute = '/welcome';
    }
  }

  String getInitialRoute() => initRoute;

}