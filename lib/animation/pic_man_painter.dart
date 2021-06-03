import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicManPainter extends CustomPainter {
  final Color color;
  final Animation<double> angle;
  Paint _paint = Paint();

  PicManPainter({this.color = Colors.yellowAccent, this.angle})
      : super(repaint: angle);

  @override
  void paint(Canvas canvas, Size size) {
    // 剪切画布
    canvas.clipRect(Offset.zero & size);
    final double radius = size.width / 2;
    canvas.translate(radius, size.height / 2);

    _drawHead(canvas, size);
    _drawEye(canvas, radius);
  }

  @override
  bool shouldRepaint(covariant PicManPainter oldDelegate) {
    return oldDelegate.color != color;
  }

  void _drawHead(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
        center: Offset.zero, width: size.width, height: size.height);
    var a = angle.value / 180 * pi;
    canvas.drawArc(rect, a, 2 * pi - a.abs() * 2, true, _paint..color = color);
  }

  void _drawEye(Canvas canvas, double radius) {
    canvas.drawCircle(Offset(radius * 0.15, -radius * 0.6), radius * 0.12,
        _paint..color = Colors.white);
  }
}
