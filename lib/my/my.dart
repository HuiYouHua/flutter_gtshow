import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTMinePage extends StatefulWidget {
  GTMinePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTMinePageState createState() => _GTMinePageState();
}

class _GTMinePageState extends State<GTMinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
          child: Text("我的"),
        )
    );
  }
}
