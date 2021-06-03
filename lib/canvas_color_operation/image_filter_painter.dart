import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageFilterPainter extends CustomPainter {
  final ui.Image image;

  double get imgW => image.width.toDouble();

  double get imgH => image.height.toDouble();

  ImageFilterPainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;
    canvas.translate(100, size.height / 2);
    _drawImageFilter(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawImageFilter(Canvas canvas) {
    // 滤色
    Paint paint = Paint();
    _drawImage(canvas, paint);
    // 使图片变模糊
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4);
    _drawImage(canvas, paint);
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6);
    _drawImage(canvas, paint);
    paint.imageFilter = ui.ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8);
    _drawImage(canvas, paint);
    // 使图片进行矩阵变换
    paint.imageFilter = ui.ImageFilter.matrix(Matrix4.skew(pi / 8, 0).storage);
    _drawImage(canvas, paint);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(image, Rect.fromLTRB(0, 0, imgW, imgH),
        Rect.fromLTRB(0, 0, imgW / 2, imgH / 2), paint);
    canvas.translate(120, 0);
  }
}
