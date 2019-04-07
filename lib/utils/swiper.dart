import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'dart:async';

class PicSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PicSwiperState();
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


  @override
  void initState() {
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
    _itemCount = 3;
    _autoplay = false;
    _autoplayDely = 3000;
    _viewportFraction = 0.8;
    _outer = false;
    _scrollDirection = Axis.horizontal;
    _autoplayDisableOnInteraction = false;
    super.initState();
  }

  Widget _buildItem(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(_radius)),
      child: new Image.network(
        "https://www.virginexperiencedays.co.uk/content/img/product/large/the-view-from-the-12102928.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildSwiper() {
    return new Swiper(
      onTap: (int index) {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Product Details"),
            ),
            body: Container(),
          );
        }));
      },
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
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
