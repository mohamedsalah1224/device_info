import Flutter
import UIKit
import KeychainSwift

public class SwiftDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_info", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getDeviceId" {
      let keychain = KeychainSwift()
      let deviceKey = keychain.get("device_id")
      if deviceKey == nil {
        keychain.set(UIDevice.current.identifierForVendor!.uuidString, forKey: "device_id")
      }
      result(keychain.get("device_id"))
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
