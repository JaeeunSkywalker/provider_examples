import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.jaeeun.shin/app"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler({
      (call: FlutterMethodChannel, result: @escaping FlutterResult) -> Void in
      if call.method == "openURL" {
        guard let args = call.arguments as? [String: Any],
              let url = args["url"] as? String,
              let urlObj URL(string: url) else {
              result(FLutterError(code: "INVALID_ARGUMENT", message: "URL is required", details: nil))
              return
        }
        if UIApplication.shared.canOpenURl(urlObj) {
          UIApplication.shared.open(urlObj, options: [:], completionHandler: nil)
          result(true)
        } else {
          result(FlutterError(code: "UNABLE_TO_OPEN_URL", message: "Cannot open URL", details: nil))
        }
      } else {
      result(FlutterMethodNotImplemented)
      }
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
