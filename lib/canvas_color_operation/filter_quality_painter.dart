import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterQualityPainter extends CustomPainter {
  final ui.Image image;

  double get imgW => image.width.toDouble();

  double get imgH => image.height.toDouble();

  FilterQualityPainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;
    canvas.translate(100, size.height / 2);
    _drawFilterQuality(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawFilterQuality(Canvas canvas) {
    // 滤色
    Paint paint = Paint();
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6);
    paint.maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    paint.colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.modulate);

    paint.filterQuality = FilterQuality.none;
    _drawImage(canvas, paint);

    paint.filterQuality = FilterQuality.low;
    _drawImage(canvas, paint);

    paint.filterQuality = FilterQuality.medium;
    _drawImage(canvas, paint);

    paint.filterQuality = FilterQuality.high;
    _drawImage(canvas, paint);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(image, Rect.fromLTRB(0, 0, imgW, imgH),
        Rect.fromLTRB(0, 0, imgW / 2, imgH / 2), paint);
    canvas.translate(120, 0);
  }
}
