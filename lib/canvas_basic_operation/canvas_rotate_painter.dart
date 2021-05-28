import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasRotatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 画布的起点移到屏幕中心
    canvas.translate(size.width / 2, size.height / 2);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.drawLine(
        Offset(20, 20),
        Offset(50, 50),
        paint
          ..color = Colors.red
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);
    _drawDot(canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawDot(Canvas canvas, Paint paint) {
    final int count = 12;
    paint
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    canvas.save();
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }
}
