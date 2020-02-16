import 'package:flutter/material.dart';
import 'package:ezar/style/theme.dart' as MTheme;

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
      'History Page',
      style: _nameTextStyle,
    );
  }

  Widget _buildCard() {
    return new SizedBox(
      height: MediaQuery
          .of(context)
          .size.height-200, //设置高度
      child: new Card(
        elevation: 0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))), //设置圆角
        child: new Column( // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('Today',
                  style: new TextStyle(fontWeight: FontWeight.w300)),

            ),

            new ListTile(
              title: new Text('Kobe Beef',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('February 16, 2020'),
              leading: new Icon(
                Icons.people,
                color: Colors.blue[500],
              ),
            ),


            new Divider(),
            new Divider(),
            new ListTile(
              title: new Text('Yesterday',
                  style: new TextStyle(fontWeight: FontWeight.w300)),
            ),
            new ListTile(
              title: new Text('Tim Hortons'),
              subtitle: new Text('February 15, 2020'),
              leading: new Icon(
                Icons.local_drink,
                color: Colors.blue[500],
              ),
            ), new ListTile(
              title: new Text('Bake Chef'),
              subtitle: new Text('February 15, 2020'),
              leading: new Icon(
                Icons.fastfood,
                color: Colors.blue[500],
              ),
            ),
          ],

        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double aHeight;
    aHeight = MediaQuery
        .of(context)
        .padding
        .top;

    if (aHeight == 44) {
      aHeight = 0;
    }else if (aHeight == 0 || aHeight == 20) {
      aHeight = 25;
    }
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
    _buildCard(),

    ],
    ),
    );
  }
}
