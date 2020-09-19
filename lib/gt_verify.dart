
import 'dart:async';

import 'package:flutter/services.dart';

class GtVerify {
  static const MethodChannel _channel =
      const MethodChannel('gt_verify');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future <String> startWithAppId(String appId) async {
    final String gyId = await _channel.invokeMethod('startWithAppId',[appId]);
    return gyId;
  }
  static Future <Map> preGetToken() async {
    final map = await _channel.invokeMapMethod('preGetToken');
    return map;
  }
  static void getCurrentVC() {
    _channel.invokeMethod('currentVC');
  }
}
