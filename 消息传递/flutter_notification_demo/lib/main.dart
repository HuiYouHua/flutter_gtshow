import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage> {

  String _msg = "通知: ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification demo'),),
      ///监听通知, 并拿到通知内容刷新处理
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + " ";
          });
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_msg),
            CustomChild(),
          ],
        ),
      ),
    );
  }
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      ///发出通知
      onPressed: () => CustomNotification('Hi').dispatch(context),
      child: Text('Fire Notification'),
    );
  }
}

///自定义一个通知, 通知一般都是继承自Notification的
///一般都是 子 => 父 的数据传递
class CustomNotification extends Notification {

  ///通知发送的消息
  final String msg;

  CustomNotification(this.msg);
}








