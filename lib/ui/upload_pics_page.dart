//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:flutter/services.dart';
//import 'package:multi_image_picker/material_options.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:ezar/utils/asset_view.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:uuid/uuid.dart';
//import 'package:flutter_image_compress/flutter_image_compress.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';
//
//class UploadPics extends StatefulWidget {
//  @override
//  _UploadPicsState createState() => new _UploadPicsState();
//}
//
//class _UploadPicsState extends State<UploadPics> {
//  List<Asset> images = List<Asset>();
//  List<String> _imagePath = [];
//  List<StorageUploadTask> _upLoadTask = [];
//  String _error = 'No Error Dectected';
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  Widget buildGridView() {
//    return GridView.count(
//      crossAxisCount: 3,
//      children: List.generate(images.length, (index) {
//        Asset asset = images[index];
//        //String imagePath = _imagePath[index];
//        StorageUploadTask _task =
//            _upLoadTask.length != 0 && _upLoadTask.length >= index + 1
//                ? _upLoadTask[index]
//                : null;
//        VoidCallback _cancel = _task != null ? _task.cancel : null;
//        return AssetView(
//          _task,
//          _cancel,
//          index,
//          //imagePath,
//          asset,
//          key: UniqueKey(),
//        );
//      }),
//    );
//  }
//
//  Future<void> saveImage() async {
//    var assetStream = new Stream.fromIterable(images);
//    List<String> imagePath = [];
//
//    await for (var asset in assetStream) {
//      //Generate uuid for picture name
//      String uuid = Uuid().v1();
//      ByteData byteData = await asset.requestOriginal();
//      List<int> imageData = byteData.buffer.asUint8List();
//
//      print('Begin to compress pictures');
//      //Compress the pictures by using plugin
//      var result =
//      await FlutterImageCompress.compressWithList(imageData, quality: 50);
//      //acquire temp dir
//      String _path;
//      Directory _directory = await getTemporaryDirectory();
//      Directory _imageDirectory =
//      await new Directory('${_directory.path}/image/')
//          .create(recursive: true);
//      _path = _imageDirectory.path;
//
//      print('Get the temp dir：${_imageDirectory.path}');
//      //Save the compressed pictures to temp dir
//      File imageFile = new File('${_path}originalImage_$uuid.jpg')
//        ..writeAsBytesSync(result);
//
//      imagePath.add(imageFile.path);
//
//      print('The dir of the pic is：${imageFile.path}');
//
//      // Release the image data
//      asset.releaseOriginal();
//
//
//      //print('Begin to upload to firebase storage');
//      StorageReference ref = FirebaseStorage.instance
//          .ref()
//          .child('IDPics')
//          .child('image_${uuid}.jpg');
//
//      StorageUploadTask uploadTask = ref.putFile(imageFile);
//
//      setState(() {
//        _upLoadTask.add(uploadTask);
//      });
//
//
//      StorageTaskSnapshot snapshot = await uploadTask.onComplete;
//      String link = await snapshot.ref.getDownloadURL();
//
//      print(link);
//    }
//
//    if (!mounted) return;
//
//    setState(() {
//      _upLoadTask.clear();
//    });
//
//  }
//
////  Future<void> deleteAssets() async {
////    await MultiImagePicker.deleteImages(assets: images);
////    setState(() {
////      images = List<Asset>();
////    });
////  }
//
//
//
//  Future<void> loadAssets() async {
//    setState(() {
//      images = List<Asset>();
//    });
//
//    List<Asset> resultList = List<Asset>();
//    String error = 'No Error Dectected';
//
//    try {
//      resultList = await MultiImagePicker.pickImages(
//          maxImages: 300,
//          enableCamera: true,
//          cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//          materialOptions: MaterialOptions(
//              actionBarColor: "#abcdef",
//              actionBarTitle: "Pick Images",
//              allViewTitle: "All Photos"));
//    } on PlatformException catch (e) {
//      error = e.message;
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      images = resultList;
//      _error = error;
//    });
//
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: const Text('Uploading Pictures'),
//        backgroundColor: Colors.lightBlue,
//      ),
//      body: Column(
//        children: <Widget>[
//          Center(child: Text('Error: $_error')),
//          RaisedButton(
//            child: Text("Pick images"),
//            onPressed: loadAssets,
//          ),
//          images.length > 0
//              ? RaisedButton(
//                  child: Text("Upload images"),
//                  onPressed: () => saveImage(),
//                )
//              : Container(),
//          Expanded(
//            child: images.length > 0 ? buildGridView() : Container(),
//          )
//        ],
//      ),
//    );
//  }
//}
