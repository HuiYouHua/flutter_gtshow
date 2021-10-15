import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/redux/hhy_state.dart';
import 'package:redux/redux.dart';
/// Created by 华惠友
/// on 2020/10/27 5:09 PM
/// description: 登录相关Redux

final loginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginResult),
  TypedReducer<bool, LogoutAction>(_logoutResult)
]);

bool _loginResult(bool result, LoginSuccessAction action) {
  result = action.success;
  return result;
}

bool _logoutResult(bool result, LogoutAction action) {
  return true;
}

class LoginSuccessAction {
  final BuildContext context;
  final bool success;

  LoginSuccessAction(this.context, this.success);
}

class LogoutAction {
  final BuildContext context;

  LogoutAction(this.context);
}

class UserInfoMiddleware1 implements MiddlewareClass<HHYState> {
  @override
  call(Store<HHYState> store, action, next) {
    print('中间件 1 开始执行了');

    if (action is LogoutAction) {
      print('中间件1 拦截到 ------- 用户登出 ');
      print('可以在这里处理清除用户数据等操作');
    }

    /// next看情况要不要执行
    /// 如果执行了，那后续的中间件和该action对应的逻辑都会执行
    /// 如果不执行，那就执行到这边就完了，后续的中间件和该action对应的逻辑都不会执行
    print("执行next方法，触发下一个中间件");
    next(action);
  }
}

class UserInfoMiddleware2 implements MiddlewareClass<HHYState> {
  @override
  call(Store<HHYState> store, action, next) {
    print('中间件 2 开始执行了');

    if (action is LogoutAction) {
      print('中间件2 拦截到 ------- 用户登出 ');
      print('可以在这里处理清除用户数据等操作');
    }

    /// next看情况要不要执行
    /// 如果执行了，那后续的中间件和该action对应的逻辑都会执行
    /// 如果不执行，那就执行到这边就完了，后续的中间件和该action对应的逻辑都不会执行
    print("执行next方法，触发下一个中间件");
    next(action);
  }
}