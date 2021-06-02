import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorFilterModePainter extends CustomPainter {
  final ui.Image image;

  double get imgW => image.width.toDouble();

  double get imgH => image.height.toDouble();

  ColorFilterModePainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;
    canvas.translate(100, size.height / 2);
    _drawColorFilter(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawColorFilter(Canvas canvas) {
    // 滤色
    Paint paint = Paint()..colorFilter = ColorFilter.linearToSrgbGamma();
    _drawImage(canvas, paint);
    paint = Paint()
      ..colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.modulate);
    _drawImage(canvas, paint);
    paint = Paint()
      ..colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.difference);
    _drawImage(canvas, paint);
    paint = Paint()
      ..colorFilter = ColorFilter.mode(Colors.blue, BlendMode.plus);
    _drawImage(canvas, paint);
    paint = Paint()
      ..colorFilter = ColorFilter.mode(Colors.blue, BlendMode.lighten);
    _drawImage(canvas, paint);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(image, Rect.fromLTRB(0, 0, imgW, imgH),
        Rect.fromLTRB(0, 0, imgW / 2, imgH / 2), paint);
    canvas.translate(120, 0);
  }
}
