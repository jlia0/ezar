import 'package:flutter/material.dart';

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



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Wallet Page"),
//          bottom: new TabBar(
//            tabs: <Widget>[
//              new Tab(
//                text: "Discover",
//              ),
//              new Tab(
//                text: "Favourites",
//              ),
//            ],
//            labelColor: Colors.black,
//            indicatorColor: Colors.deepOrangeAccent,
//          ),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
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
            ),
            new Expanded(
              child: new TabBarView(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topCenter,
                    child: new Text("tab1"),
                  ),


                  new Align(
                    alignment: Alignment.topCenter,
                    child: new Text("tab2"),
                  ),
//                    new Center(child: new Text('Tab1')),
//                    new Center(child: new Text('Tab2')),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
