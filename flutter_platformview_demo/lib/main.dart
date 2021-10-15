import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const platform = const MethodChannel('com.flutter.guide.MyFlutterView');

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('传递参数给原生View'),
                onPressed: () {
                  count ++;
                  platform.invokeMethod('setText', {'content': '传递的参数内容: ${count.toString()}'});
                },
              ),
              Container(
                child: platformView(),
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              RaisedButton(
                child: Text('改变原生View颜色'),
                onPressed: () {
                  platform.invokeMethod('changeColor');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget platformView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          onPlatformViewCreated: (viewId) {
            print('viewId: ${viewId}');
//            platforms.add(MethodChannel('com.flutter.guide.MyFlutterView_$viewId'));
          },
          creationParams: {'text': 'Flutter传给AndroidTextView的参数'},
          creationParamsCodec: StandardMessageCodec(),
        );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'plugins.flutter.io/custom_platform_view',
        creationParams: {'text': 'Flutter传给IOSTextView的参数'},
        creationParamsCodec: StandardMessageCodec(),
      );
    }
    return Container();
  }
}

