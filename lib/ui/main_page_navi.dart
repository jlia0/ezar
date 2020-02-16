import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ezar/ui/history_page.dart';
import 'package:ezar/ui/settings_page.dart';
import 'package:ezar/ui/wallet_page.dart';
import 'package:ezar/ui/profile_page.dart';
import 'package:ezar/utils/fab_bottom_app_bar.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class MainPage extends StatefulWidget {
  String user_id;

  //bool business;

  MainPage({this.user_id});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool business = false;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  loadData() async {
    print(widget.user_id);

    Response re3 = await Dio()
        .post("https://ez-ar.herokuapp.com/users/getters/business", data: {
      "user_id": widget.user_id,
    });

    var result3 = re3.toString();
    setState(() {
      print(result3);
      if (result3 == "Yes") {
        business = true;
      } else {
        business = false;
      }
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> JumpToAR() async {
    const demoPlugin = const MethodChannel('demo.plugin');
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.absolute.path + "/json.json";
    Map<String, String> map = {"flutter": path};
    await demoPlugin.invokeMethod('interaction', map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ProfilePage(
            user_id: widget.user_id,
          ),
          WalletPage(),
          HistoryPage(),
          SettingsPage(
            busi: business,
          )
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: FABBottomAppBar(
        currentIndex: _currentIndex,
        centerItemText: 'AR',
        color: Colors.grey,
        selectedColor: Colors.lightBlue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.person_outline, text: 'Profile'),
          FABBottomAppBarItem(
              iconData: Icons.account_balance_wallet, text: 'Deals'),
          FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {JumpToAR();},
        tooltip: 'Scanning AR',
        child: Icon(Icons.camera_alt),
        elevation: 2.0,
      ),
    );
  }
}
