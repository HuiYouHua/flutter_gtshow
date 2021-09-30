import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTMessagePage extends StatefulWidget {
  GTMessagePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTMessagePageState createState() => _GTMessagePageState();
}

class _GTMessagePageState extends State<GTMessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
          child: Text("消息"),
        )
    );
  }
}
