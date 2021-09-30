import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTIndexPage extends StatefulWidget {
  GTIndexPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTIndexPageState createState() => _GTIndexPageState();
}

class _GTIndexPageState extends State<GTIndexPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
          child: Text("首页"),
        )
    );
  }
}
