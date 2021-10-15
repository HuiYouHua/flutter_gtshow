import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        
      let reg: FlutterPluginRegistrar = registrar(forPlugin: "plugins.flutter.io/custom_platform_view_plugin")!
    let factory = MyFlutterViewFactory(messager: reg.messenger())
    reg.register(factory, withId: "plugins.flutter.io/custom_platform_view")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
