/// Created by 华惠友
/// on 2020/10/29 11:13 AM
/// description: 

///Flutter 向原生发送消息
class FlutterToNativeStringConst {
  ///消息通道插件名称
  static const String flutterMessagePluginChannelName = "flutterToNative.channelName.flutterMessagePlugin";
  ///消息通道插件方法名称
  static const String flutterMessagePluginMethodName1 = "flutterToNative.methodName.flutterMessagePlugin1";
  static const String flutterMessagePluginMethodName2 = "flutterToNative.methodName.flutterMessagePlugin2";
}

///原生向 Flutter 发送消息
class NativeToFlutterStringConst {
  ///消息通道插件名称
  static const String flutterMessagePluginChannelName = "nativeToFlutter.channelName.flutterMessagePlugin";
  ///消息通道插件方法名称
  static const String flutterMessagePluginMethodName1 = "nativeToFlutter.methodName.flutterMessagePlugin1";
  static const String flutterMessagePluginMethodName2 = "nativeToFlutter.methodName.flutterMessagePlugin2";
}