import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ezar/ui/login_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';





void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

//  loadIDPics() async{
//    Directory _directory = await getApplicationDocumentsDirectory();
//    Directory _d = await getTemporaryDirectory();
//
//    print(_directory);
//    print(_d);
//}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

//    load() async {
//      Directory dir = await getApplicationDocumentsDirectory();
//      String path = dir.path + "/kfc.jpg";
//      print(path);
//
//
//      Response re = await Dio().download(
//          "http://salvidatech.com/IDPics/kfc.jpg", path);
//
////                          Uint8List bytes = await re.bodyBytes;
////
////                          print(bytes.length);
//
//      File imageFile = new File(path);
////                            ..writeAsBytesSync(bytes);
//
//      print(imageFile.path);
//
//      print(await imageFile.exists());
//    }
//
//    load();



//    SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(
//          statusBarColor: Colors.white,
//          statusBarIconBrightness: Brightness.dark,)
//      //systemNavigationBarColor: Colors.white,);
//    );
    return new MaterialApp(
      title: 'EZ-AR',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}
