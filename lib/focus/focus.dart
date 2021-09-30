import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTFocusPage extends StatefulWidget {
  GTFocusPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTFocusPageState createState() => _GTFocusPageState();
}

class _GTFocusPageState extends State<GTFocusPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
          child: Text("关注"),
        )
    );
  }
}
