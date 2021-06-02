import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderGradientRadialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    _drawShaderRadial(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawShaderRadial(Canvas canvas) {
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    // radial 径向渐变
    paint.shader =
        ui.Gradient.radial(Offset.zero, 25, colors, pos, TileMode.clamp);
    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.translate(160, 0);
    paint.shader =
        ui.Gradient.radial(Offset.zero, 50, colors, pos, TileMode.repeated);
    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.translate(-160 * 2.0, 0);
    paint.shader = ui.Gradient.radial(
        Offset.zero, 25, colors, pos, TileMode.mirror, null, Offset(-10, -10));
    canvas.drawCircle(Offset.zero, 50, paint);
  }
}
