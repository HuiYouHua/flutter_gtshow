import 'dart:async';

import 'package:redux/redux.dart';
/// Created by 华惠友
/// on 2020/10/27 6:56 PM
/// description: 

class User {
  String name;
  int age;

  User({this.name, this.age});

  @override
  bool operator == (Object other) {
    bool result = identical(this, other) || other is User && runtimeType == other.runtimeType && (name == other.name && age == other.age);
    return result;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode;
  }
}

class DataBloc {
  ///定义一个Controller
  StreamController<List<String>> _dataController = StreamController<List<String>>();
  ///获取 StreamSink 做 add 入口
  StreamSink<List<String>> get _dataSink => _dataController.sink;
  ///获取 Stream 用于监听
  Stream<List<String>> get _dataStream => _dataController.stream;
  ///事件订阅对象
  StreamSubscription _dataSubscription;

  init() {
    ///监听事件
    _dataSubscription = _dataStream.listen((value){
      ///do change
    });
    ///改变事件
    _dataSink.add(["first", "second", "three", "more"]);

  }

  close() {
    ///关闭
    _dataSubscription.cancel();
    _dataController.close();
  }
}