import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let shareMovieChannel = FlutterMethodChannel(name: "com.vladimir.hodaryonok.star_movie/shareMovie", binaryMessenger: controller.binaryMessenger)
      shareMovieChannel.setMethodCallHandler({
          [weak self](call: FlutterMethodCall, result: FlutterResult) -> Void in
          guard call.method == "share_movie" else{
              result(FlutterMethodNotImplemented)
              return
          }
          self?.shareContent(content: call.arguments)
        })
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func shareContent(content : Any){
          let controller = UIActivityViewController(activityItems:[content], applicationActivities: nil)
          let viewController = UIApplication.shared.keyWindow!.rootViewController
          viewController?.present(controller,animated: true)
          }
}
