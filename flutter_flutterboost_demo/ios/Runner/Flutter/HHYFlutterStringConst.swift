//
//  HHYFlutterStringConst.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/29.
//

import Foundation

///Flutter 向原生发送消息
class HHYFlutterToNativeStringConst {
    ///消息通道插件名称
    static var flutterMessagePluginChannelName = "flutterToNative.channelName.flutterMessagePlugin"
    ///消息通道插件方法名称
    static var flutterMessagePluginMethodName1 = "flutterToNative.methodName.flutterMessagePlugin1"
    static var flutterMessagePluginMethodName2 = "flutterToNative.methodName.flutterMessagePlugin2"
}

///原生向 Flutter 发送消息
class HHYNativeToFlutterStringConst {
    ///消息通道插件名称
    static var flutterMessagePluginChannelName = "nativeToFlutter.channelName.flutterMessagePlugin"
    ///消息通道插件方法名称
    static var flutterMessagePluginMethodName1 = "nativeToFlutter.methodName.flutterMessagePlugin1"
    static var flutterMessagePluginMethodName2 = "nativeToFlutter.methodName.flutterMessagePlugin2"
}
