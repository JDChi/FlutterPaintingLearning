import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderGradientLinearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    canvas.translate(-100, 0);
    _drawShaderLinear(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawShaderLinear(Canvas canvas) {
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
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 50;

    // 渐变起点、终点、颜色列表、每个颜色所处的分率
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(100, 0), colors, pos);
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);

    canvas.save();
    canvas.translate(-240, 0);
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(100, 0), colors, pos , TileMode.mirror);
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);
    canvas.restore();

    canvas.save();
    canvas.translate(240, 0);
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(100, 0), colors, pos , TileMode.repeated);
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);

    canvas.restore();
    canvas.translate(0, 100);
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(100, 0), colors, pos , TileMode.decal);
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);





  }
}
