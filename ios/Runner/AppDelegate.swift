import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
  let rootViewController : FlutterViewController = window?.rootViewController as! FlutterViewController
  let binaryMessenger = rootViewController as! FlutterBinaryMessenger
      let article = CustomMyDataAPI.init()
      MyDataApiSetup(binaryMessenger,article)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
