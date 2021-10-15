//
//  HHYFlutterController.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/29.
//

import UIKit
import Flutter
import flutter_boost

class HHYFlutterController: FLBFlutterViewContainer {
    
    private lazy var btn: UIButton = {
        let b = UIButton(type: .custom)
        b.setTitle("发送消息到Flutter", for: .normal)
        b.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        b.backgroundColor = .red
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fd_prefersNavigationBarHidden = true
        
        btn.frame = CGRect(x: 100, y: 150, width: 100, height: 30)
        view.addSubview(btn)
    }
    
    @objc func btnClick() {
//            //原生向Flutter发送消息 name: 通道名称 Flutter内置方法
//            let channel = FlutterMethodChannel(name: HHYNativeToFlutterStringConst.flutterMessagePluginChannelName, binaryMessenger: self.binaryMessenger)
//            ///method: 方法名称, arguments: 参数内容
//            channel.invokeMethod(HHYNativeToFlutterStringConst.flutterMessagePluginMethodName1, arguments: ["content": "123"]) { (result) in
//                print(result ?? "");
//            }
        //
        ///不区别通道名称和方法名称
        FlutterBoostPlugin.sharedInstance().sendEvent(HHYNativeToFlutterStringConst.flutterMessagePluginMethodName2, arguments: ["content": "这是原生发给flutter的参数"])
    }

}
