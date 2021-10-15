//
//  MyFlutterViewFactory.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/30.
//

import UIKit
import Flutter
class MyFlutterViewFactory: NSObject, FlutterPlatformViewFactory {
    
    var messager: FlutterBinaryMessenger
    
    init(messager: FlutterBinaryMessenger) {
        self.messager = messager
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return MyFlutterView(frame, viewId: viewId, args: args, messager: messager)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

    
}
