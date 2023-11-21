import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DataStorage {

  DataStorage({required this.fileName}){
    fileName = fileName;
  }
  String fileName;

  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File>  get _localFile async{

    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<List<String>> readLine() async {

    final file = await _localFile;
    final contents = await file.readAsLines();
    return contents;
  }

 

  Future<bool> isFile() async {
    final directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    path += '/$fileName';
    debugPrint(path);
    return  FileSystemEntity.isFile(path);
  }

  void writeLine(String line) async {
    final file = await _localFile;
    file.writeAsStringSync(line + Platform.lineTerminator, mode:FileMode.append);
  }

}