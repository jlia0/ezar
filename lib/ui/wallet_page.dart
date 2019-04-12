import 'package:flutter/material.dart';
import 'package:ezar/style/theme.dart' as MTheme;

class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WalletPageState();
  }
}

class WalletPageState extends State<WalletPage>
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

  Widget _buildCard() {
    return new SizedBox(
      height: 636.0, //设置高度
      child: new Card(
        elevation: 0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))), //设置圆角
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('Cards',
                  style: new TextStyle(fontWeight: FontWeight.w300)),
              leading: new Icon(
                Icons.credit_card,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Pepsi',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('Gift Card'),
              leading: new Icon(
                Icons.local_drink,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Village Ice Cream',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('Gift Card'),
              leading: new Icon(
                Icons.fastfood,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new Divider(),
            new ListTile(
              title: new Text('Coupons',
                  style: new TextStyle(fontWeight: FontWeight.w300)),
              leading: new Icon(
                Icons.card_travel,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Qinma Hot Pot'),
              subtitle: new Text('30% OFF'),
              leading: new Icon(
                Icons.restaurant,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Dairy Queen'),
              subtitle: new Text('50% OFF'),
              leading: new Icon(
                Icons.restaurant,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Chinook Cineplex'),
              subtitle: new Text('One Free Ticket'),
              leading: new Icon(
                Icons.tab,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
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
      'Wallet Page',
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
    }else if (aHeight == 0 || aHeight == 20) {
      aHeight = 44;
    }
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Column(
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
            ],
          ),

          _buildCard(),
        ],
      ),
    );
  }
}
