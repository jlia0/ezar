import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezar/ui/product_details_page.dart';
import 'package:path_provider/path_provider.dart';

class PicSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PicSwiperState();
  }
}

class ImageJSON {
  final String IDPicsName;
  final String IDPicsPath;
  final String VideoLink;

  ImageJSON({this.IDPicsName, this.IDPicsPath, this.VideoLink});

  factory ImageJSON.fromJson(Map<String, dynamic> json) {
    return ImageJSON(
      IDPicsName: json['name'],
      IDPicsPath: json['path'],
      VideoLink: json['link'],
    );
  }
  @override
  String toString() {
    return '{"name": "$IDPicsName", "path": "$IDPicsPath", "link": "$VideoLink"}';
  }
}

class _PicSwiperState extends State<PicSwiper>
    with AutomaticKeepAliveClientMixin {
  int _itemCount;
  bool _loop;
  bool _autoplay;
  int _autoplayDely;
  double _padding;
  bool _outer;
  double _radius;
  double _viewportFraction;
  SwiperLayout _layout;
  int _currentIndex;
  double _scale;
  Axis _scrollDirection;
  Curve _curve;
  double _fade;
  bool _autoplayDisableOnInteraction;
  CustomLayoutOption customLayoutOption;
  SwiperController _controller;
  List Ads = [];
  List<ImageJSON> JSON = [];

  loadData() async {
    Response re = await Dio().get('http://ez-ar.herokuapp.com/users/json');
    var result = json.decode(re.toString());
    List ImagePath = [];

    Directory dir = await getApplicationDocumentsDirectory();

    var imageStream = new Stream.fromIterable(result);

    await for (var image in imageStream) {
      String path = dir.path + "/" + image['pic_id'].toString() + ".jpg";

      File imageFile = new File(path);
      bool exist = await imageFile.exists();
      if (exist == false) {
        await Dio().download(image['pic_link'], path);
        ImagePath.add(image['pic_link']);
        var imageJSON = new ImageJSON(
            IDPicsName: image['pic_id'].toString(),
            IDPicsPath: path,
            VideoLink: image['res_link']);
        JSON.add(imageJSON);

      } else {
        ImagePath.add(image['pic_link']);
        var imageJSON = new ImageJSON(
            IDPicsName: image['pic_id'].toString(),
            IDPicsPath: path,
            VideoLink: image['res_link']);
        JSON.add(imageJSON);
      }
    }

    //Write JSON file
    String path = dir.absolute.path + "/json.json";
    File JSONFile = new File (path);

    await JSONFile.writeAsString(JSON.toString());

    print(JSON.toString());
    print(path);
    print("123");
    print(await JSONFile.exists());

    setState(() {
      Ads = ImagePath;
      _itemCount = Ads.length;
      customLayoutOption = new CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
        new Offset(-350.0, 0.0),
        new Offset(0.0, 0.0),
        new Offset(350.0, 0.0)
      ]);
      _fade = 1.0;
      _currentIndex = 0;
      _curve = Curves.ease;
      _scale = 0.8;
      _controller = new SwiperController();
      _layout = SwiperLayout.DEFAULT;
      _radius = 10.0;
      _padding = 0.0;
      _loop = false;
      _autoplay = false;
      _autoplayDely = 3000;
      _viewportFraction = 0.8;
      _outer = false;
      _scrollDirection = Axis.horizontal;
      _autoplayDisableOnInteraction = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Widget _buildItem(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(_radius)),
        child: new CachedNetworkImage(
          imageUrl: Ads[index],
          //imageUrl: "http://salvidatech.com/IDPics/forests.jpg",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.fill,
        )
//      child: new Image.asset(
//        Ads[index],
//        fit: BoxFit.fill,
//      ),
    );
  }

  Widget buildSwiper() {
    bool _value = true;
    return new Swiper(
//      onTap: (int index) {
//        Navigator.of(context)
//            .push(new MaterialPageRoute(builder: (BuildContext context) {
//          return Scaffold(
//            appBar: AppBar(
//              title: Text("Product Details"),
//            ),
//            body: new Switch(
//                value: _value,
//                onChanged: (value) {
//                  setState(() {
//                    _value = value;
//                  });
//                }),
//          );
//        }));
//      },
//      onTap: (int index) {
//        Navigator.push(context,
//            new MaterialPageRoute(builder: (BuildContext context) {
//          print(json.encode(Ads[index]).toString());
//          return new ProductDetails(ads: json.encode(Ads[index]).toString());
//        }));
//      },
      customLayoutOption: customLayoutOption,
      fade: _fade,
      index: _currentIndex,
      onIndexChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      curve: _curve,
      scale: _scale,
      itemWidth: 300.0,
      controller: _controller,
      layout: _layout,
      outer: _outer,
      itemHeight: 200.0,
      viewportFraction: _viewportFraction,
      autoplayDelay: _autoplayDely,
      loop: _loop,
      autoplay: _autoplay,
      itemBuilder: _buildItem,
      itemCount: _itemCount,
      scrollDirection: _scrollDirection,
      indicatorLayout: PageIndicatorLayout.WARM,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
      pagination: new SwiperPagination(
          builder: const DotSwiperPaginationBuilder(
              size: 10.0, activeSize: 10.0, space: 8.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Ads.length != 0) {
      return new Column(
        children: <Widget>[
          new SizedBox(height: 15),
          new Container(
            child: new SizedBox(
              height: 170,
              width: double.infinity,
              child: buildSwiper(),
            ),
          ),
          new SizedBox(height: 15),
        ],
      );
    } else {
      return new Center(
        child: new Text("Loading..."),
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
