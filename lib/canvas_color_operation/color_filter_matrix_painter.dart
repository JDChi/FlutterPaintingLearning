import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorFilterMatrixPainter extends CustomPainter {
  final ui.Image image;

  double get imgW => image.width.toDouble();

  double get imgH => image.height.toDouble();

  ColorFilterMatrixPainter({this.image});

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
    const ColorFilter sepia = ColorFilter.matrix(<double>[
      0.393, 0.769, 0.109, 0, 0, //
      0.349, 0.686, 0.168, 0, 0, //
      0.272, 0.534, 0.131, 0, 0, //
      0, 0, 0, 1, 0 //
    ]);

    _drawImage(canvas, paint..colorFilter = sepia);
    const ColorFilter greyScale = ColorFilter.matrix(<double>[
      0.2126, 0.7152, 0.0722, 0, 0, //
      0.2126, 0.7152, 0.0722, 0, 0, //
      0.2126, 0.7152, 0.0722, 0, 0, //
      0, 0, 0, 1, 0, //
    ]);
    _drawImage(canvas, paint..colorFilter = greyScale);
    const ColorFilter light = ColorFilter.matrix(<double>[
      1, 0, 0, 0, 90, //
      0, 1, 0, 0, 90, //
      0, 0, 1, 0, 90, //
      0, 0, 0, 1, 0 //
    ]);
    _drawImage(canvas, paint..colorFilter = light);
    const ColorFilter darken = ColorFilter.matrix(<double>[
      1, 0, 0, 0, -126.0, //
      0, 1, 0, 0, -126.0, //
      0, 0, 1, 0, -126.0, //
      0, 0, 0, 1, 0 //
    ]);
    _drawImage(canvas, paint..colorFilter = darken);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(image, Rect.fromLTRB(0, 0, imgW, imgH),
        Rect.fromLTRB(0, 0, imgW / 2, imgH / 2), paint);
    canvas.translate(120, 0);
  }
}
