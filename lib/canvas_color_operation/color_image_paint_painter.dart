import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/canvas_color_operation/color_ball.dart';

class ColorImagePaintPainter extends CustomPainter {
  Paint _paint;
  final double strokeWidth = 0.5;
  final Color color = Colors.blue;
  final List<ColorBall> balls;

  ColorImagePaintPainter({this.balls}) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.translate(-710, -1000);
    balls.forEach((element) {
      canvas.drawCircle(Offset(element.x, element.y), element.r,
          _paint..color = element.color);
    });
  }

  @override
  bool shouldRepaint(covariant ColorImagePaintPainter oldDelegate) {
    return balls != oldDelegate.balls;
  }
}
