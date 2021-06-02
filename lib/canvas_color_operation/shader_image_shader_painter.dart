import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderImageShaderPainter extends CustomPainter {
  final ui.Image image;

  ShaderImageShaderPainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if(image == null)
      return;
    _moveCanvasToCenter(canvas, size);
    _drawImageShader(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawImageShader(Canvas canvas) {
    Paint paint = Paint()
      ..shader = ImageShader(
          image,
          TileMode.repeated,
          TileMode.repeated,
          Float64List.fromList(
              [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]));

    canvas.drawCircle(Offset(100, 100), 50, paint);
    canvas.translate(120, 0);
    canvas.drawCircle(
        Offset(100, 100),
        50,
        paint
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke);
    canvas.translate(-120 * 2.0, 0);

    canvas.drawLine(
        Offset(100, 50),
        Offset(100, 50 + 100.0),
        paint
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke);
  }
}
