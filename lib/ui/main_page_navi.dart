import 'package:flutter/material.dart';
import 'package:ezar/ui/history_page.dart';
import 'package:ezar/ui/settings_page.dart';
import 'package:ezar/ui/wallet_page.dart';
import 'package:ezar/ui/profile_page.dart';
import 'package:ezar/utils/fab_bottom_app_bar.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const demoPlugin = const MethodChannel('demo.plugin');
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ProfilePage(),
          WalletPage(),
          HistoryPage(),
          SettingsPage()
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
          FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: 'Wallet'),
          FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
        ],
//        type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.home,
//                color: _bottomNavigationColor,
//              ),
//              title: Text(
//                'HOME',
//                style: TextStyle(color: _bottomNavigationColor),
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.email,
//                color: _bottomNavigationColor,
//              ),
//              title: Text(
//                'Email',
//                style: TextStyle(color: _bottomNavigationColor),
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.pages,
//                color: _bottomNavigationColor,
//              ),
//              title: Text(
//                'PAGES',
//                style: TextStyle(color: _bottomNavigationColor),
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.airplay,
//                color: _bottomNavigationColor,
//              ),
//              title: Text(
//                'AIRPLAY',
//                style: TextStyle(color: _bottomNavigationColor),
//              )),
//        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          demoPlugin.invokeMethod('interaction');
        },
        tooltip: 'Scanning AR',
        child: Icon(Icons.camera_alt),
        elevation: 2.0,
      ),
    );
  }
}
