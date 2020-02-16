import 'package:flutter/material.dart';
import 'package:ezar/style/theme.dart' as MTheme;
import 'package:ezar/ui/upload_pics_page.dart';
import 'package:ezar/ui/login_page.dart';

class SettingsPage extends StatefulWidget {
  bool busi;

  SettingsPage({this.busi});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  bool _value = false;

  @override
  void initState() {
    print(widget.busi);
    _value = widget.busi;
    //super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildCard(String Name, {onTTap}) {
    Size screenSize = MediaQuery.of(context).size;

    return new SizedBox(
      height: screenSize.height * 0.07, //设置高度
      width: screenSize.width * 0.97,
      child: new Card(
        elevation: 2.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))), //设置圆角
        child: new ListTile(
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: screenSize.width * 0.1),
              Center(
                child: new Text(Name,
                    style: new TextStyle(
                        color: Colors.pinkAccent, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: onTTap,
        ),
        //new Divider(),
      ),
    );
  }

  void _onChanged(bool value) => setState(() {
        _value = value;
        widget.busi = _value;
      });

  Widget _buildSwitch(String Name) {
    Size screenSize = MediaQuery.of(context).size;

    return new SizedBox(
      height: screenSize.height * 0.07, //设置高度
      width: screenSize.width * 0.97,
      child: new Card(
        elevation: 2.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))), //设置圆角
        child: new ListTile(
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: screenSize.width * 0.18),
              Center(
                child: new Text(Name,
                    style: new TextStyle(
                        color: Colors.pinkAccent, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          trailing: new Container(
            child: new Switch(value: _value, onChanged: _onChanged),
          ),
          onTap: () {
            setState(() {
              _value = !_value;
            });
          },
        ),
        //new Divider(),
      ),
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height * 0.1,
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

  Widget _buildHead() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Spectral',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w300,
    );

    return Text(
      'Settings Page',
      style: _nameTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double aHeight;
    aHeight = MediaQuery.of(context).padding.top;

    if (aHeight == 44) {
      aHeight = 0;
    } else if (aHeight == 0 || aHeight == 20) {
      aHeight = 25;
    }

    if (widget.busi == true) {
      return Scaffold(
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
                        Center(
                          child: _buildHead(),
                        ),
                        //SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
//            _buildSwitch("Business Account"),
            _buildCard("Notifications"),
            _buildCard("Help & Feedback"),
            _buildCard("About"),
            _buildCard("Logout", onTTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute(builder: (context) => new LoginPage()),
                  (route) => route == null);
            }),
            _buildCard("Upload Ads", onTTap: () {
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (BuildContext context) {
//                return new UploadPics();
//              }));
            }),
          ],
        ),
      );
    } else {
      return Scaffold(
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
                        Center(
                          child: _buildHead(),
                        ),
                        //SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
//            _buildSwitch("Business Account"),
            _buildCard("Notifications"),
            _buildCard("Help & Feedback"),
            _buildCard("About"),
            _buildCard("Logout", onTTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute(builder: (context) => new LoginPage()),
                  (route) => route == null);
            }),
          ],
        ),
      );
    }
  }
}
