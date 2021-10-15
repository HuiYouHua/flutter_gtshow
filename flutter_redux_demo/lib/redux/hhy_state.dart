import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/model/user.dart';
import 'package:flutter_redux_demo/redux/counter_redux.dart';
import 'package:flutter_redux_demo/redux/locale_redux.dart';
import 'package:flutter_redux_demo/redux/login_redux.dart';
import 'package:flutter_redux_demo/redux/theme_redux.dart';
import 'package:flutter_redux_demo/redux/user_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

/// Created by 华惠友
/// on 2020/10/27 5:06 PM
/// description: 


/// 组合Action
class HHYState {
  ///用户信息
  User userInfo;

  ///主题数据
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocal;

  ///是否登录
  bool login = false;

  ///计数器
  int counter;

  HHYState({this.userInfo, this.themeData, this.locale, this.login, this.counter});
}


/// 组合Reducer
HHYState appReducer(HHYState state, action) {
  return HHYState(
    ///通过 UserReducer 将 HHYState 内的 userInfo 和 action 关联在一起
  userInfo: userReducer(state.userInfo, action),
    themeData: themeDataReducer(state.themeData, action),
    locale: localeReducer(state.locale, action),
    login: loginReducer(state.login, action),
    counter: counterReducer(state.counter, action),
  );
}

///组合中间件
final List<Middleware<HHYState>> middleware = [
  ///redux异步
  thunkMiddleware,
  UserInfoMiddleware1(),
  UserInfoMiddleware2(),
];

ThunkAction<HHYState> fetchCounter = (Store<HHYState> store) async {
  await Future.delayed(Duration(milliseconds: 3000));

  store.dispatch(CounterAction(counter: 1000));
};





