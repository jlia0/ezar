import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ezar/style/theme.dart' as MTheme;
import 'package:ezar/utils/fab_bottom_app_bar.dart';
import 'package:ezar/ui/history_page.dart';
import 'package:ezar/ui/settings_page.dart';
import 'package:ezar/ui/wallet_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final String _fullName = "Jian Liao";

//  final String _status = "Software Developer";
////  final String _bio =
////      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
////  final String _followers = "173";
////  final String _posts = "24";
////  final String _scores = "450";
////  TabController _tabController;

//  int _currentIndex;
//  List<Widget> _pages;

//  @override
//  void initState() {
//    // TODO: implement initState
//    _currentIndex = 0;
//    _pages
//      ..add(ProfilePage())
//      ..add(WalletPage())
//      ..add(HistoryPage())
//      ..add(SettingsPage());
//
//    super.initState();
//  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 3.7,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              MTheme.Colors.loginGradientStart,
              MTheme.Colors.loginGradientEnd
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/profile.jpeg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Spectral',
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.w300,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

//  Widget _buildTabBar() {
//    return Container(
//      color: Colors.blue,
//      width: 200,
//      height: 38.0,
//      child: TabBar(
//        //controller: _tabController,
//        tabs: <Widget>[
//          new Tab(
//            icon: new Icon(Icons.directions_bike),
//          ),
//          new Tab(
//            icon: new Icon(Icons.directions_boat),
//          ),
//        ],
//        isScrollable: true,
//      ),
//    );
//  }
//
//  Widget _buildStatus(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//      decoration: BoxDecoration(
//        color: Theme.of(context).scaffoldBackgroundColor,
//        borderRadius: BorderRadius.circular(4.0),
//      ),
//      child: Text(
//        _status,
//        style: TextStyle(
//          fontFamily: 'Spectral',
//          color: Colors.black,
//          fontSize: 20.0,
//          fontWeight: FontWeight.w300,
//        ),
//      ),
//    );
//  }
//
//  Widget _buildStatItem(String label, String count) {
//    TextStyle _statLabelTextStyle = TextStyle(
//      fontFamily: 'Roboto',
//      color: Colors.black,
//      fontSize: 16.0,
//      fontWeight: FontWeight.w200,
//    );
//
//    TextStyle _statCountTextStyle = TextStyle(
//      color: Colors.black54,
//      fontSize: 24.0,
//      fontWeight: FontWeight.bold,
//    );
//
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(
//          count,
//          style: _statCountTextStyle,
//        ),
//        Text(
//          label,
//          style: _statLabelTextStyle,
//        ),
//      ],
//    );
//  }
//
//  Widget _buildStatContainer() {
//    return Container(
//      height: 60.0,
//      margin: EdgeInsets.only(top: 8.0),
//      decoration: BoxDecoration(
//        color: Color(0xFFEFF4F7),
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          _buildStatItem("Followers", _followers),
//          _buildStatItem("Posts", _posts),
//          _buildStatItem("Scores", _scores),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildBio(BuildContext context) {
//    TextStyle bioTextStyle = TextStyle(
//      fontFamily: 'Spectral',
//      fontWeight: FontWeight.w400,
//      //try changing weight to w500 if not thin
//      fontStyle: FontStyle.italic,
//      color: Color(0xFF799497),
//      fontSize: 16.0,
//    );
//
//    return Container(
//      color: Theme.of(context).scaffoldBackgroundColor,
//      padding: EdgeInsets.all(8.0),
//      child: Text(
//        _bio,
//        textAlign: TextAlign.center,
//        style: bioTextStyle,
//      ),
//    );
//  }
//
//  Widget _buildSeparator(Size screenSize) {
//    return Container(
//      width: screenSize.width / 1.6,
//      height: 2.0,
//      color: Colors.black54,
//      margin: EdgeInsets.only(top: 4.0),
//    );
//  }
//
//  Widget _buildGetInTouch(BuildContext context) {
//    return Container(
//      color: Theme.of(context).scaffoldBackgroundColor,
//      padding: EdgeInsets.only(top: 8.0),
//      child: Text(
//        "Get in Touch with ${_fullName.split(" ")[0]},",
//        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
//      ),
//    );
//  }
//
//  Widget _buildButtons() {
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            child: InkWell(
//              onTap: () => print("followed"),
//              child: Container(
//                height: 40.0,
//                decoration: BoxDecoration(
//                  border: Border.all(),
//                  color: Color(0xFF404A5C),
//                ),
//                child: Center(
//                  child: Text(
//                    "FOLLOW",
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.w600,
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//          SizedBox(width: 10.0),
//          Expanded(
//            child: InkWell(
//              onTap: () => print("Message"),
//              child: Container(
//                height: 40.0,
//                decoration: BoxDecoration(
//                  border: Border.all(),
//                ),
//                child: Center(
//                  child: Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Text(
//                      "MESSAGE",
//                      style: TextStyle(fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }

//  void _selectedTab(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 200),
                    _buildProfileImage(),
                    SizedBox(height: 10.0),
                    _buildFullName(),
                    SizedBox(height: 15.0),
                    new TabBar(
                      tabs: <Widget>[
                        new Tab(
                          text: "Discover",
                        ),
                        new Tab(
                          text: "Favourites",
                        ),
                      ],
                      labelColor: Colors.black,
                      indicatorColor: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
//        bottomNavigationBar: FABBottomAppBar(
//          centerItemText: 'AR',
//          color: Colors.grey,
//          selectedColor: Colors.lightBlue,
//          notchedShape: CircularNotchedRectangle(),
//          onTabSelected: _selectedTab,
//          items: [
//            FABBottomAppBarItem(
//                iconData: Icons.person_outline, text: 'Profile'),
//            FABBottomAppBarItem(
//                iconData: Icons.account_balance_wallet, text: 'Wallet'),
//            FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
//            FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
//          ],
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            _selectedTab(1);
//          },
//          tooltip: 'Scanning AR',
//          child: Icon(Icons.camera_alt),
//          elevation: 2.0,
//        ),
      ),
    );
  }
}
