import 'package:flutter/material.dart';
import 'package:oob/themes/OobColors.dart';

class MainTheme {
  static final MainTheme _singleton = MainTheme._internal();

  factory MainTheme() {
    return _singleton;
  }

  MainTheme._internal();

  ThemeData instance = ThemeData(
    primaryColor: OobColors.mediumBlue,
    accentColor: Color(0xffffffff),
    fontFamily: 'Kollektif'
  );

}