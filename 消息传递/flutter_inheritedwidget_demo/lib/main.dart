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

  int count = 0;

  void _incrementCounter() {
    setState(() {
      count ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountContainer(
      model: this,
      increment: _incrementCounter,
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///拿到共享的widget
    ///子视图中任意层级都可以通过该方法拿到, 实现跨层共享数据
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('InheritedWidget demo'),),
      body: Text('You have pushed the button this many times: ${state.model.count}'),
      floatingActionButton: FloatingActionButton(onPressed: state.increment),
    );
  }
}

///跨层传输数据, 无论是在下层的第几层, 通过 CountContainer.of(context) 都可以拿到共享的数据
///而不需要一层一层的传输数据了
///CountContainer 持有model, 这样就可以方便共享model中定义的所有内容, 而非一个变量
///它的传输方式是 父 -> 子, 可以跨层
class CountContainer extends InheritedWidget {
  ///方便其子Widget在Widget树中找到它
  ///过期了
//  static CountContainer of(BuildContext context) => context.inheritFromWidgetOfExactType(CountContainer) as CountContainer;
  static CountContainer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CountContainer>();

  ///共享数据
//  final int count;
  ///直接使用MyHomePage中的State获取数据
  final _MyHomePageState model;
  final Function() increment;

//  CountContainer({ Key key, @required this.count, @required Widget child, }): super(key: key, child: child);
  CountContainer({ Key key, @required this.model, @required this.increment, @required Widget child, }): super(key: key, child: child);


//  @override
//  bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model.count != oldWidget.model.count;
}









