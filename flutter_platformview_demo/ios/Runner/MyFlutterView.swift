//
//  MyFlutterView.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/30.
//

import UIKit
import Flutter
class MyFlutterView: NSObject, FlutterPlatformView {
    
    let label = UILabel()
    
    init(_ frame: CGRect, viewId: Int64, args: Any?, messager: FlutterBinaryMessenger) {
        super.init()
        print(frame)
        print(viewId)
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            label.text  = dict.value(forKey: "text") as? String
        }
        label.backgroundColor = UIColor.randomColor()
        label.textColor = .black
        
        let methodChannel = FlutterMethodChannel(name: "com.flutter.guide.MyFlutterView", binaryMessenger: messager)
        methodChannel.setMethodCallHandler { [weak self](call, result) in
            if (call.method == "setText") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let content = dict["content"] as? String ?? ""
                    self?.label.text = content
                }
            } else if (call.method == "changeColor") {
                self?.label.backgroundColor = UIColor.randomColor()
            }
        }
    }
    
    /// FlutterPlatformView 协议方法, 需要返回的视图
    func view() -> UIView {
//        label.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        return label
    }
}
