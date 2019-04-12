import 'package:flutter/material.dart';
import 'package:ezar/ui/history_page.dart';
import 'package:ezar/ui/settings_page.dart';
import 'package:ezar/ui/wallet_page.dart';
import 'package:ezar/ui/profile_page.dart';
import 'package:ezar/utils/fab_bottom_app_bar.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  String user_id;
  MainPage({this.user_id});

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
          ProfilePage(user_id: widget.user_id,),
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
          FABBottomAppBarItem(
              iconData: Icons.account_balance_wallet, text: 'Wallet'),
          FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
        ],
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
