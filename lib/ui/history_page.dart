import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HistoryPageState();
  }
}

class HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("History"),
        textTheme: TextTheme(title: TextStyle(color:Colors.blueGrey,fontSize: 18)),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: TextField(

      ),
    );


  }


}

