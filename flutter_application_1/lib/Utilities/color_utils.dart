import 'package:flutter/material.dart';

class ColorUtils {
  static Color hexToColor(String hexColor) {
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static var appGreen = hexToColor('#CFF80B');
  static var appWhite = hexToColor('#FFFFFF');
  static var appRed = hexToColor('#FF2257');
  static var appBlack = hexToColor('#111111');
  static var appCyan = hexToColor('#00FFA4');
  static var appGrey = hexToColor('#1E1E1E');
  static var appLightGrey = hexToColor('#87888C');
  static var appBlue = hexToColor('#00FFA4');
}
