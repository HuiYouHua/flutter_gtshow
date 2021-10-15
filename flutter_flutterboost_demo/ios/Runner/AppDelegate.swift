import UIKit
import Flutter
import flutter_boost

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    ///注册插件
    ///在appDelegate中引入，PlatformRouterImp，用于实现平台侧的页面打开和关闭，不建议直接使用用于页面打开，建议使用FlutterBoostPlugin中的open和close方法来打开或关闭页面；
    ///PlatformRouterImp内部实现打开各种native页面的映射。
    let router = HHYPlatformRouterImp()
    
    
//    self.window = UIWindow(frame: UIScreen.main.bounds)
//    self.window?.makeKeyAndVisible()
//    self.window?.backgroundColor = .white
//
//    1.直接设置根视图为Flutter视图
//    let accotunVc = HHYFlutterController()
//    accotunVc.setName("accountPage", params: [:])
//    self.window?.rootViewController = accotunVc

//    2.或者根据storyboard, 根视图为原生, 通过操作跳转Flutter界面
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
