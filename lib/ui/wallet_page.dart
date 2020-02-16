import 'package:flutter/material.dart';
import 'package:ezar/style/theme.dart' as MTheme;
import 'package:cached_network_image/cached_network_image.dart';


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

  void showQRCode(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: new Text("Scan QR Code"),
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:"https://firebasestorage.googleapis.com/v0/b/ez-ar-47896.appspot.com/o/IDPics%2FQR.png?alt=media&token=04a0f65f-edd7-4175-a582-e72f8fdaa63d",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.fill,
              )
            ],
          );
        });
  }

  void showBarCode(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: new Text("Scan Bar Code"),
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:"https://firebasestorage.googleapis.com/v0/b/ez-ar-47896.appspot.com/o/IDPics%2Fbarcode.png?alt=media&token=0a6ef443-0dab-4838-8419-0e0688bf14de",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.fill,
              )
            ],
          );
        });
  }


  Widget _buildCard(BuildContext context) {
    return new SizedBox(
      height: MediaQuery.of(context).size.height - 200, //设置高度
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
              title: new Text('Tim Hortons',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('Gift Card'),
              leading: new Icon(
                Icons.local_drink,
                color: Colors.blue[500],
              ),
              onTap: (){
                showBarCode(context);
              },
            ),
            new ListTile(
              title: new Text('Star Bucks',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('Gift Card'),
              leading: new Icon(
                Icons.local_drink,
                color: Colors.blue[500],
              ),
              onTap: (){
                showBarCode(context);
              },
            ),
            new Divider(),
            new Divider(),
            new ListTile(
              title: new Text('Coupons',
                  style: new TextStyle(fontWeight: FontWeight.w300)),
              leading: new Icon(
                Icons.fastfood,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('Bake Chef'),
              subtitle: new Text('30% OFF'),
              leading: new Icon(
                Icons.restaurant,
                color: Colors.blue[500],
              ),
              onTap: (){
                showQRCode(context);
              },
            ),
            new ListTile(
              title: new Text('Kobe Beef'),
              subtitle: new Text('30% OFF'),
              leading: new Icon(
                Icons.restaurant,
                color: Colors.blue[500],
              ),
              onTap: (){
                showQRCode(context);
              },
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
      'Deals Page',
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
          _buildCard(context),
        ],
      ),
    );
  }
}
