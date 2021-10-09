import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTLiveRoomPage extends StatefulWidget {
  GTLiveRoomPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTLiveRoomPageState createState() => _GTLiveRoomPageState();
}

class _GTLiveRoomPageState extends State<GTLiveRoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//
//          title: Text(widget.title),
//        ),
        body: Center(
          child: Text("直播间"),
        )
    );
  }
}
