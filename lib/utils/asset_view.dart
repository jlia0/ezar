//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//import 'package:multi_image_picker/asset.dart';
//import 'package:transparent_image/transparent_image.dart';
//
//class AssetView extends StatefulWidget {
//  final StorageUploadTask task;
//  final VoidCallback onCancel;
//  final int _index;
//
//  //final String imagePath;
//  final Asset _asset;
//
//  AssetView(
//    this.task,
//    this.onCancel,
//    this._index,
//    //this.imagePath,
//    this._asset, {
//    Key key,
//  }) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() =>
//      AssetState(this.task, this.onCancel, this._index, this._asset);
//}
//
//class AssetState extends State<AssetView> {
//  StorageUploadTask task;
//  VoidCallback onCancel;
//  int _index = 0;
//
//  //String imagePath;
//  Asset _asset;
//
//  AssetState(this.task, this.onCancel, this._index, this._asset);
//
//  @override
//  void initState() {
//    super.initState();
//    _loadImage();
//  }
//
//  void _loadImage() async {
//    await this._asset.requestThumbnail(300, 300, quality: 50);
//
//    if (this.mounted) {
//      setState(() {});
//    }
//  }
//
//  get status {
//    String result;
//    if (widget.task.isComplete) {
//      if (widget.task.isSuccessful) {
//        result = 'Success';
//      } else if (widget.task.isCanceled) {
//        result = 'Cancel';
//      } else
//        result = 'Failed:${widget.task.lastSnapshot.error}';
//    } else if (widget.task.isPaused) {
//      result = 'Pause';
//    } else if (widget.task.isInProgress) {
//      result = 'Uploading';
//    }
//    return result;
//  }
//
//  _bytePercent(StorageTaskSnapshot snapshot) {
//    return '${((snapshot.bytesTransferred / snapshot.totalByteCount) * 100).toInt()}%';
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (widget.task != null) {
//      return new StreamBuilder<StorageTaskEvent>(
//        stream: widget.task.events,
//        builder: (BuildContext context,
//            AsyncSnapshot<StorageTaskEvent> asyncSnapShot) {
//          Widget subtitle;
//          if (asyncSnapShot.hasData) {
//            StorageTaskEvent event = asyncSnapShot.data;
//            StorageTaskSnapshot snapshot = event.snapshot;
//            subtitle = new Text(
//              '$status:${_bytePercent(snapshot)}',
//              style: new TextStyle(color: Colors.white),
//            );
//          } else
//            subtitle = null;
//          return new Stack(
//            alignment: Alignment.bottomCenter,
//            children: <Widget>[
////              new FadeInImage(
////                placeholder: new MemoryImage(kTransparentImage),
////                image:
////                    new MemoryImage(this._asset.thumbData.buffer.asUint8List()),
////                fit: BoxFit.cover,
////                width: (MediaQuery
////                    .of(context)
////                    .size
////                    .width) / 3,
////                height: (MediaQuery
////                    .of(context)
////                    .size
////                    .width) / 3,
////              ),
//              new Image.memory(
//                this._asset.thumbData.buffer.asUint8List(),
//                fit: BoxFit.cover,
//                gaplessPlayback: true,
//              ),
//              new Positioned(
//                right: 0.00,
//                top: 0.00,
//                child: new GestureDetector(
//                  onTap: onCancel,
//                  child: new Container(
//                    decoration: new BoxDecoration(
//                      color: Colors.black45,
//                      shape: BoxShape.circle,
//                    ),
//                    child: new Icon(
//                      Icons.close,
//                      color: Colors.white,
//                      size: 20.0,
//                    ),
//                  ),
//                ),
//              ),
//              subtitle != null
//                  ? new Positioned(
//                      child: new Container(
//                      alignment: Alignment.center,
//                      height: 20.0,
////                      width:
////                          (MediaQuery.of(context).size.width - 35.0 - 8.0) / 3,
//                      color: Colors.black45,
//                      child: subtitle,
//                    ))
//                  : Container()
//            ],
//          );
//        },
//      );
//    } else if (null != this._asset.thumbData) {
//      return Image.memory(
//        this._asset.thumbData.buffer.asUint8List(),
//        fit: BoxFit.cover,
//        gaplessPlayback: true,
//      );
////      return new FadeInImage(
////        placeholder: new MemoryImage(kTransparentImage),
////        image: new MemoryImage(this._asset.thumbData.buffer.asUint8List()),
////        fit: BoxFit.cover,
////        width: (MediaQuery.of(context).size.width - 35.0 - 8.0) / 3,
////        height: (MediaQuery.of(context).size.width - 35.0 - 8.0) / 3,
////      );
//    } else {
//      return Text(
//        '${this._index}',
//        style: Theme.of(context).textTheme.headline,
//      );
//    }
//
////      return new FadeInImage(
////        placeholder: new MemoryImage(kTransparentImage),
////        image: AssetImage(
////          imagePath,
////        ),
////        fit: BoxFit.cover,
////        width: (MediaQuery.of(context).size.width - 35.0 - 8.0) / 3,
////        height: (MediaQuery.of(context).size.width - 35.0 - 8.0) / 3,
////      );
//  }
//}
//
////  @override
////  Widget build(BuildContext context) {
////    if (null != this._asset.thumbData) {
////      return Image.memory(
////        this._asset.thumbData.buffer.asUint8List(),
////        fit: BoxFit.cover,
////        gaplessPlayback: true,
////      );
////    }
////
////    return Text(
////      '${this._index}',
////      style: Theme.of(context).textTheme.headline,
////    );
////  }
////}
