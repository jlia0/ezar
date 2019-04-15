import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ProductDetails extends StatefulWidget {
  String ads;
  ProductDetails({this.ads});

  @override
  _ProductDetailsState createState() => new _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Product Details Page'),
      ),
      body: Column(
        children: <Widget>[
          Center(child: Text(widget.ads)),

        ],
      ),
    );
  }
}
