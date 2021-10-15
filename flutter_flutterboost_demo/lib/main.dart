import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_flutterboost_demo/const/string_const.dart';
import 'package:flutter_flutterboost_demo/plugin/flutter_message_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState() {
    super.initState();


    FlutterBoost.singleton.registerPageBuilders({
      'accountPage': (pageName, params, _) => MyHomePage(title: "我的",),
    });
    FlutterBoost.onPageStart();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(
        )
    );
  }

  void _onRoutePushed(String pageName, String uniqueId, Map params, Route route, Future _) {
    print("pageName: " + pageName);
    print("uniqueId: " + uniqueId);
    print("params: " + params.toString());
    print("route: " + route.toString());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

const MethodChannel _channel = const MethodChannel(
    NativeToFlutterStringConst.flutterMessagePluginChannelName);

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _listenCancelable;

  void _incrementCounter() {
    setState(() {
      _counter++;
//      FlutterToNativeMessagePlugin.postMessageToNative("Flutter 向原生 发送的消息: ${_counter.toString()}");

      ///打开原生页面, 实际上是调用    func open(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) , 在该方法中做处理
//      FlutterBoost.singleton.open("firstPage");

      try {
        ///注意: 这里通过FlutterBoost发送消息给原生时, 通道名方法名是一样的
        FlutterBoost.singleton.channel.sendEvent(
            FlutterToNativeStringConst.flutterMessagePluginChannelName, {"content": "1231456"});
      } catch (e) {

      }
    });
  }

  @override
  void initState() {
    super.initState();

    _addListen();
  }

  @override
  void dispose() {
    super.dispose();

    _listenCancelable();
  }

  void _addListen() {
    ///监听原生向Flutter发送消息, Flutter内置方法
    _channel.setMethodCallHandler((message) async {
       String method = message.method;
       var argument = message.arguments;
       if (argument == NativeToFlutterStringConst.flutterMessagePluginMethodName1) {
         print("原生调用flutter: 方法名: ${method}, 参数: ${argument}");
       }
      return "flutter返回给原生的数据: 123";
    });


      ///flutterboost 监听原生发送给Flutter消息 这里不区别通道和方法名称, flutterboost都是一样的
    _listenCancelable = FlutterBoost.singleton.channel.addEventListener(NativeToFlutterStringConst.flutterMessagePluginMethodName2, (name, arguments) {
//      if (name == NativeToFlutterStringConst.flutterMessagePluginMethodName2) {
        print(arguments.toString());
//      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

