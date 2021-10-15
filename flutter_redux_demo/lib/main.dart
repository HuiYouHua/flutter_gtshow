import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/redux/counter_redux.dart';
import 'package:flutter_redux_demo/redux/hhy_state.dart';
import 'package:flutter_redux_demo/redux/login_redux.dart';
import 'package:flutter_redux_demo/redux/theme_redux.dart';
import 'package:flutter_redux_demo/redux/user_redux.dart';
import 'package:redux/redux.dart';

import 'common/hhy_style.dart';
import 'model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ///创建Store 整个应用只能有一个Store, 是用来保存数据的地方
  final store = Store<HHYState>(
      appReducer,
      ///Middleware，中间件，它的操作在发出 Action 和执行 Reducer 这两步之间发生，用于增加额外功能，如处理异步操作或者打印日志功能等
      middleware: middleware,
      initialState: HHYState(
          userInfo: User(),
          themeData: ThemeData(
            primaryColor: HHYColors.primarySwatch,
            platform: TargetPlatform.iOS,
          ),
          login: false,
          locale: Locale('zh', 'CH'),
        counter: 0,
      ),
  );

  @override
  Widget build(BuildContext context) {
    ///将Store放入顶层
    return StoreProvider(
      store: store,
      child: StoreBuilder<HHYState>(builder: (context, store) {
        store.state.platformLocal = WidgetsBinding.instance.window.locale;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: store.state.themeData,
          locale: store.state.locale,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      Store<HHYState> store = StoreProvider.of(context);

      ///发出Action
      User user = User(name: "我的名字是: " + _counter.toString());
      store.dispatch(UpdateUserInfoAction(user));

      List<Color> colors = HHYColors.getThemeListColor();
      ThemeData themeData =
          new ThemeData(primarySwatch: colors[_counter % colors.length]);
      store.dispatch(new RefreshThemeAction(themeData));

      store.dispatch(CounterAction(counter: _counter));
    });
  }

  void _loginClick() {
    Store<HHYState> store = StoreProvider.of(context);
    store.dispatch(new LoginSuccessAction(context, true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      ///在子页面中获取Strore中的State
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ///采用了 StoreConnector 来提供数据, 它会经过converter函数, 将 store 进行转换成你想要的数据模型, 然后在builder中进行使用
          ///另外可以通过控制distinct属性来控制当State没发生变化时, 不进行刷新界面操作, 需要重写模型的 == 和 hasCode方法
          StoreConnector<HHYState, User>(
            distinct: true,
              ///通过 converter 将 GSYState 中的 userInfo返回, 就是下面build中的userInfo对象
              converter: (store) {
//                store.dispatch(CounterAction(counter: _counter));
                return store.state.userInfo;
              },
              ///在 userInfo 中返回实际渲染的控件
              builder: (context, userInfo) {
                return Text(userInfo.name == null ? "我的名字是: " : userInfo.name);
              }),
          StoreConnector<HHYState, int>(
              converter: (store) => store.state.counter,
              builder: (context, counter) {
                return Text("计数器: " + counter.toString());
              }),
          StoreBuilder<HHYState>(
            builder: (context, store) {
              if (store.state.login == false) {
                return FlatButton(
                  child: Text('登录'),
                  onPressed: _loginClick,
                  color: Colors.blue,
                );
              } else {
                return Text('已登录');
              }
            },
          ),
          ///redux 异步
          StoreConnector<HHYState, int>(
            onInit: (store) {
              ///初始化
                store.dispatch(fetchCounter);
              },
              converter: (store) => store.state.counter,
              builder: (context, counter) {
                return Text("异步计数器: " + counter.toString());
              }),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
