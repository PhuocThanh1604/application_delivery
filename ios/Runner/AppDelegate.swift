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
    GMSServices.provideAPIKey:@"AIzaSyB2kvOckQn8vJlqi8PPnbOzK5dCf-xg3eQ";
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
