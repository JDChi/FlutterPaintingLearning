import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/animation/color_double_tween.dart';

class PicManPainter extends CustomPainter {
  final Animation<double> repaint;
  Paint _paint = Paint();

  final ColorDoubleTween tween = ColorDoubleTween(
      begin: ColorDouble(color: Colors.blue, value: 10),
      end: ColorDouble(color: Colors.red, value: 40));

  PicManPainter({this.repaint}) : super(repaint: repaint);

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
    return oldDelegate.repaint != repaint;
  }

  void _drawHead(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
        center: Offset.zero, width: size.width, height: size.height);
    var a = tween.evaluate(repaint).value / 180 * pi;
    canvas.drawArc(rect, a, 2 * pi - a.abs() * 2, true,
        _paint..color = tween.evaluate(repaint).color);
  }

  void _drawEye(Canvas canvas, double radius) {
    canvas.drawCircle(Offset(radius * 0.15, -radius * 0.6), radius * 0.12,
        _paint..color = Colors.white);
  }
}
