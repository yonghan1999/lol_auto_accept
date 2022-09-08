import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {

  static Color gray600 = fromHex('#887e7e');

  static Color gray700 = fromHex('#625b5b');

  static Color blueA400 = fromHex('#1977f3');

  static Color gray701 = fromHex('#555151');

  static Color bluegray100 = fromHex('#cccccc');

  static Color gray200 = fromHex('#ebe9eb');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray800 = fromHex('#3f3d56');

  static Color black900 = fromHex('#000000');

  static Color gray40000 = fromHex('#00c4c4c4');

  static Color deepPurpleA700 = fromHex('#6a00bf');

  static Color purpleA100 = fromHex('#f79aee');

  static Color purple500 = fromHex('#980dc9');

  static Color whiteA700 = fromHex('#ffffff');

  // to config custom color


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
