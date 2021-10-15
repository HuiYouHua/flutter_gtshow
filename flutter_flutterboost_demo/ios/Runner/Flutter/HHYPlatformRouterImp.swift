//
//  HHYPlatformRouterImp.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/29.
//

import UIKit
import flutter_boost

///用于实现平台侧的页面打开和关闭，不建议直接使用用于页面打开，建议使用FlutterBoostPlugin中的open和close方法来打开或关闭页面；
class HHYPlatformRouterImp: NSObject {
    
    static var sharedRouter = HHYPlatformRouterImp()
    private var cancelable: FLBVoidCallback?
    
    deinit {
        cancelable?()
    }
    
    override init() {
        super.init()
        
        ///初始化FlutterBoost混合栈环境。应在程序使用混合栈之前调用。如在AppDelegate中。本函数默认需要flutter boost来注册所有插件。
        FlutterBoostPlugin.sharedInstance().startFlutter(with: self, onStart: { [weak self](engine) in
            ///注册插件, 这里拿到的插件就是Flutter中 使用的方法通道的插件
            ///这里面的就是 Flutter提供的功能, 跟FlutterBoost没有关系, FlutterBoost只是在这里对Flutter的消息通道做了一层封装
            self?.listenMethodCallHandler(engine: engine)
            
            //            let channel = FlutterMethodChannel(name: HHYFlutterStringConst.flutterMessagePluginChannelName, binaryMessenger: engine.binaryMessenger)
            //            channel.invokeMethod("nativetofluttermethod", arguments: ["content": "123"])
        });
    }
}

extension HHYPlatformRouterImp {
    
    ///注册插件 并处理事件
    private func listenMethodCallHandler(engine: FlutterEngine) {
        ///Flutter原生 API
//        let channel = FlutterMethodChannel(name: HHYFlutterToNativeStringConst.flutterMessagePluginChannelName, binaryMessenger: engine.binaryMessenger)
//        ///监听Flutter侧调用原生方法: result: 回调
//        channel.setMethodCallHandler { (call, result) in
//            let method = call.method
//            if method == HHYFlutterToNativeStringConst.flutterMessagePluginMethodName1 {
//
//                ///获取参数内容并回调结果
//                if let arguments = call.arguments as? NSDictionary, let content = arguments["content"] as? String {
//                    print(content)
//                    result("原生返回Flutter的数据: 123")
//                }
//            } else {
//                result(FlutterMethodNotImplemented)
//            }
//        }
        
        ///FlutterBoost 监听Flutter向原生发送消息, 注意Flutter中, 通过FlutterBoost发送消息给原生时, 通道名方法名是一样的
        cancelable = FlutterBoostPlugin.sharedInstance().addEventListener({ (method, arguments) in
//            if method == HHYFlutterToNativeStringConst.flutterMessagePluginMethodName2 {
                ///获取参数内容并回调结果
            if let arg = arguments as? [String: Any], let content = arg["content"] as? String {
                    print(content)
//                self.navigationController().pushViewController(FirstViewController(), animated: true)

                let vc = HHYFlutterController.init();
                vc.setName("accountPage", params: [:]);
                self.navigationController().pushViewController(vc, animated: true);
                
                }
//            }
        }, forName: HHYFlutterToNativeStringConst.flutterMessagePluginChannelName);
    }
}

extension HHYPlatformRouterImp: FLBPlatform {
    /**
     * 基于Native平台实现页面打开，Dart层的页面打开能力依赖于这个函数实现；Native或者Dart侧不建议直接使用这个函数。应直接使用FlutterBoost封装的函数
     *
     * @param url 打开的页面资源定位符
     * @param urlParams 传人页面的参数; 若有特殊逻辑，可以通过这个参数设置回调的id
     * @param exts 额外参数
     * @param completion 打开页面的即时回调，页面一旦打开即回调
     */
    func open(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        if url == "h5://open.native.activityHub" {
            //            let vc = NLHybridViewUtils.openWebView(url: NLFlintData.shared.act_2339.activityHub(), title: "活动中心")
            //            self.navigationController().pushViewController(vc, animated: true)
        } else if url == "firstPage" {
            self.navigationController().pushViewController(FirstViewController(), animated: true)
        } else {
            let vc = HHYFlutterController.init();
            vc.setName(url, params: urlParams);
            self.navigationController().pushViewController(vc, animated: animated);
        }
        completion(true);
    }
    
    /**
     * 基于Native平台实现present页面打开，Dart层的页面打开能力依赖于这个函数实现；Native或者Dart侧不建议直接使用这个函数。应直接使用FlutterBoost封装的函数
     *
     * @param url 打开的页面资源定位符
     * @param urlParams 传人页面的参数; 若有特殊逻辑，可以通过这个参数设置回调的id
     * @param exts 额外参数
     * @param completion 打开页面的即时回调，页面一旦打开即回调
     */
    func present(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let vc = FLBFlutterViewContainer.init();
        vc.setName(url, params: urlParams);
        navigationController().present(vc, animated: animated) {
            completion(true);
        };
    }
    
    /**
     * 基于Native平台实现页面关闭，Dart层的页面关闭能力依赖于这个函数实现；Native或者Dart侧不建议直接使用这个函数。应直接使用FlutterBoost封装的函数
     *
     * @param uid 关闭的页面唯一ID符
     * @param result 页面要返回的结果（给上一个页面），会作为页面返回函数的回调参数
     * @param exts 额外参数
     * @param completion 关闭页面的即时回调，页面一旦关闭即回调
     */
    func close(_ uid: String, result: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let presentedVC = self.navigationController().presentedViewController;
        let vc = presentedVC as? FLBFlutterViewContainer;
        if vc?.uniqueIDString() == uid {
            vc?.dismiss(animated: animated, completion: {
                completion(true);
            });
        }else{
            self.navigationController().popViewController(animated: animated);
        }
    }
    
    func navigationController() -> UINavigationController {
        //        let delegate = UIApplication.shared.delegate as! AppDelegate
        //        let navigationController = delegate.window?.rootViewController as! UINavigationController
        let navigationController = UIViewController.current()?.navigationController ?? UINavigationController()
        
        return navigationController;
    }
}

extension UIViewController{
    
    class func current(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return current(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return current(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return current(base: presented)
        }
        return base
    }
}

