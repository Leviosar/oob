import 'package:flutter/material.dart';

class MathUtil {
  static double map(double input, Tween<double> inputRange, Tween<double> outputRange) {
    double delta = (outputRange.end - outputRange.begin) / (inputRange.end - inputRange.begin);
    double output = outputRange.begin + delta * (input - inputRange.begin);
    return output;
  }
}