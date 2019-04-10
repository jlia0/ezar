import 'package:flutter/material.dart';
import 'package:ezar/style/theme.dart' as MTheme;

class MyApp extends StatelessWidget {





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





  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Identification Pictures',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title'),
                      SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),

      child: Text(
        'Product Description',

        softWrap: true,
      ),


    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          textTheme: TextTheme(title: TextStyle(color:Colors.blueGrey,fontSize: 18)),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
    children: [
    Image.asset(
    'images/lake.jpg',
    width: 600,
    height: 140,
    fit: BoxFit.cover,
    ),
    titleSection,
    buttonSection,
    textSection,
    ],

        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}