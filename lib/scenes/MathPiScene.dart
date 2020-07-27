import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oob/helper/MathUtil.dart';
import 'package:oob/themes/OobColors.dart';

class MathPiScene extends Game {

  String piDigitsString = "31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116093";
  List<int> pi;
  int index = 0;
  int digit;
  int nextDigit;
  Offset start;
  Offset end;
  double startAngle;
  double endAngle;
  Size dimensions;
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];

  MathPiScene(this.dimensions) {
    pi = this.piDigitsString.split('').map((String char) => int.parse(char)).toList();
  }
  
  @override
  void render(Canvas canvas) {
    // Background transparent
    Rect bgRect = Rect.fromLTWH(25, 25, this.dimensions.width - 50, this.dimensions.width - 50);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.transparent;
    canvas.drawRect(bgRect, bgPaint);

    /// Rounded arc
    Paint fgPaint = Paint();
    fgPaint.style = PaintingStyle.stroke;
    fgPaint.color = Colors.white;
    fgPaint.strokeWidth = 2.0;
    canvas.drawArc(bgRect, 0, 180, false, fgPaint);

    canvas.translate(this.dimensions.width / 2, this.dimensions.height / 2);
   
    Paint linePaint = Paint();
    linePaint.color = OobColors.lighOrange;
    linePaint.style = PaintingStyle.stroke;

    for (var i = 0; i < this.startPoints.length; i++) {
      canvas.drawLine(this.startPoints[i], this.endPoints[i], linePaint);
    }

    canvas.translate(- this.dimensions.width / 2, - this.dimensions.height / 2);
  }

  @override
  void update(double t) {
    if (index < pi.length - 1) {
      digit = pi[index];
      nextDigit = pi[index + 1];
      index += 1;
      
      startAngle = MathUtil.map(digit.toDouble(), Tween(begin: 0, end: 10), Tween(begin: 0, end: 2 * math.pi));
      endAngle = MathUtil.map(nextDigit.toDouble(), Tween(begin: 0, end: 10), Tween(begin: 0, end: 2 * math.pi));

      start = Offset((this.dimensions.width - 50) / 2 * math.cos(startAngle), (this.dimensions.width - 50) / 2 * math.sin(startAngle));
      end = Offset((this.dimensions.width - 50) / 2 * math.cos(endAngle), (this.dimensions.width - 50) / 2 * math.sin(endAngle));

      this.startPoints.add(start);
      this.endPoints.add(end);
    }
  }

  @override
  void resize(Size size) {
    dimensions = size;
    super.resize(size);
  }
}