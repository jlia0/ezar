import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ezar/style/theme.dart' as MTheme;
import 'package:ezar/utils/swiper.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final String _fullName = "Jian Liao";

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height * 0.26,
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

  Widget _buildProfileImage(Size screensize) {
    return Center(
      child: Container(
        width: screensize.height*0.13,
        height: screensize.height*0.13,
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

  Widget _buildTabBar() {
    return Container(
      child: new TabBar(
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
    );
  }

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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double aHeight;
    aHeight=MediaQuery.of(context).padding.top;

    if(aHeight==44){
      aHeight=10;
    }

    if(aHeight==0 || aHeight==20){
      aHeight=44;
    }


    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                _buildCoverImage(screenSize),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: aHeight),
                        _buildProfileImage(screenSize),
                        SizedBox(height:15),
                        _buildFullName(),
                        //SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buildTabBar(),
            new Expanded(
              child: new TabBarView(
                children: <Widget>[
                  new PicSwiper(),
                  new Center(child: new Text('Tab2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
