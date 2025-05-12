import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInfo {
  final MethodChannel _channel = const MethodChannel('device_info');

  Future<String> get deviceId async {
    return await _channel.invokeMethod('getDeviceId');
  }
}
