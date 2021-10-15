import 'package:flutter/services.dart';
import 'package:flutter_flutterboost_demo/const/string_const.dart';

/// Created by 华惠友
/// on 2020/10/29 11:12 AM
/// description: 


///方法通道: Flutter 和 原生的交互方式, 信息传递, 方法调用
class FlutterToNativeMessagePlugin {
  ///初始化方法通道
  static const MethodChannel _channel = const MethodChannel(FlutterToNativeStringConst.flutterMessagePluginChannelName);
  
  ///发送通道消息到原生 message: 发送的消息内容
  static dynamic postMessageToNative(message) async {
    ///可能原生没有实现该方法, 因此需要捕获异常
    try {
      /// Flutter调原生方法并返回结果给Flutter
      ///第一个参数: 通道的方法名
      ///第二个参数: 可选, 传递的参数
      ///返回值 为 原生返回的数据结果, 该方法是异步执行的
      var result = await _channel.invokeMethod(
          FlutterToNativeStringConst.flutterMessagePluginMethodName1,
          {"content": message.toString()});
      print(result);
      return result;
    } on PlatformException catch(e) {
      return {"error" : e.message};
    }
  }
}

class NativeToFlutterMessagePlugin {
  ///初始化方法通道


}