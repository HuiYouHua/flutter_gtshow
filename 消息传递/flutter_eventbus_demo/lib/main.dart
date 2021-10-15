import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus_demo/event/custom_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///EventBus是一个事件总线, 第三方
///它可以在不具备关联关系的Widget进行消息传递
EventBus eventBus = EventBus();

class _MyHomePageState extends State<MyHomePage> {

  String _msg = "通知: ";

  StreamSubscription subscription;

  @override
  void initState() {

    ///监听通知
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        _msg += event.msg + "  ";
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    ///注意销毁
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EventBus demo'),),
      body: Text(_msg),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
      }),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page'),),
      body: RaisedButton(
        child: Text('发送EventBus事件'),
        onPressed: () => eventBus.fire(CustomEvent('eventBus')),
      ),
    );
  }
}











