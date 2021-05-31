import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathArcToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    _drawLine(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawLine(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var rect = Rect.fromCenter(center: Offset.zero, width: 160, height: 100);
    // forceMoveTo : 是否强行移动 ， false 的话会从当前点为开始，以圆弧的起点为终点连接
    path
      ..lineTo(30, 30)
      ..arcTo(rect, 0, pi * 1.5, true);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(200, 0);
    path
      ..lineTo(30, 30)
      ..arcTo(rect, 0, pi * 1.5, false);
    canvas.drawPath(path, paint);
  }
}
