import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Settings'),
        textTheme: TextTheme(title: TextStyle(color:Colors.blueGrey,fontSize: 18)),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: new ListView(

          children: <Widget>[
            new ListTile(
              leading: Icon( Icons.notification_important),
              title: new Text("Notifications"),
            ),
            new ListTile(
              leading: Icon(Icons.help),
              title: new Text("Help & Feedback"),
            ),
            new ListTile(
              leading: Icon(Icons.devices_other),
              title: new Text("About"),
            ),
            new ListTile(
              leading: Icon(Icons.cancel),
              title: new Text("Logout"),
            ),


          ],

      ),
    );
  }




}