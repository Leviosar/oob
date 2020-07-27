import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:oob/themes/OobColors.dart';

class HTMLStyle {
  static Map<String, Style> experienceStyles = {
    ".text-orange": Style(
      color: OobColors.lighOrange
    ),
    ".text-blue": Style(
      color: OobColors.darkBlue
    ),
    "p" : Style(
      fontSize: FontSize(18.0),
      color: Colors.white
    )
  };
}