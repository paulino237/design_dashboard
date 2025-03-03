import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HexColor extends Color {
  static const MethodChannel _channel = const MethodChannel('hexcolor');
  static const bleu = Color(0xFF3AB7FC);
  static const vert = Color(0xFF7FD862);
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
