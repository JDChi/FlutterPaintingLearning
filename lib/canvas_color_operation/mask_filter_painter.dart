import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaskFilterPainter extends CustomPainter {
  final ui.Image image;

  double get imgW => image.width.toDouble();

  double get imgH => image.height.toDouble();

  MaskFilterPainter({this.image});

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
    Paint paint = Paint();
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.outer, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
    _drawImage(canvas, paint);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(image, Rect.fromLTRB(0, 0, imgW, imgH),
        Rect.fromLTRB(0, 0, imgW / 2, imgH / 2), paint);
    canvas.translate(120, 0);
  }
}
