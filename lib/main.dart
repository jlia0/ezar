import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ezar/ui/login_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([]);

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
