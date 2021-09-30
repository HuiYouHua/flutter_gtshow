import 'package:flutter/material.dart';
import 'package:flutter_gtshow/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Route<dynamic> _getRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = {
      "/": (context) => GTHomePage(),
    };

    var widget = routes[settings.name];

    if (widget != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: widget,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        onGenerateRoute: _getRoute,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

      )
    );
  }
}
