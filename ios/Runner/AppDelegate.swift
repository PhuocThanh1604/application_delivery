import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    <!-- config map!-->
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey:@"AIzaSyD_Uu1btO6mWLrRrPBuw84FkQuLK6tFuLU";
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
