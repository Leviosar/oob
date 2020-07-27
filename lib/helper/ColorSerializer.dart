import 'package:flutter/material.dart';

class ColorSerializer {
  static Color fromJson(color) {
    int intColor = int.tryParse(color, radix: 16);
    
    if (intColor == null)
      return null;
    else
      return new Color(intColor);
  }

  static String toJson(Color color) => color.value.toRadixString(16);
}