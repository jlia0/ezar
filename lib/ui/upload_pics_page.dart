import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/material_options.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:ezar/utils/asset_view.dart';

class UploadPics extends StatefulWidget {
  @override
  _UploadPicsState createState() => new _UploadPicsState();
}

class _UploadPicsState extends State<UploadPics> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetView(
          index,
          asset,
          key: UniqueKey(),
        );
      }),
    );
  }

  Future<void> deleteAssets() async {
    await MultiImagePicker.deleteImages(assets: images);
    setState(() {
      images = List<Asset>();
    });
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
          maxImages: 300,
          enableCamera: true,
          cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
          materialOptions: MaterialOptions(
              actionBarColor: "#abcdef",
              actionBarTitle: "Pick Images",
              allViewTitle: "All Photos"));
    } on PlatformException catch (e) {
      error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Uploading Pictures'),
      ),
      body: Column(
        children: <Widget>[
          Center(child: Text('Error: $_error')),
          RaisedButton(
            child: Text("Pick images"),
            onPressed: loadAssets,
          ),
//            images.length > 0
//                ? RaisedButton(
//              child: Text("Delete images"),
//              onPressed: deleteAssets,
//            )
//                : Container(),
          Expanded(
            child: buildGridView(),
          )
        ],
      ),
    );
  }
}
