import 'package:flutter/services.dart';

class PlatformService {
  static const channel = MethodChannel('com.jaeeun.shin/app');

  static Future<void> openUrl(String url) async {
    try {
      final bool result = await channel.invokeMethod('openUrl', {'url': url});
      print('URL opened: $result');
    } on PlatformException catch (e) {
      print("Failed to open URL: '${e.message}'.");
    }
  }
}
