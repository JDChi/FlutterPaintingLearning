import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathMoveAndLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    _drawLine(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawLine(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill;
    path
      ..moveTo(0, 0)
      ..lineTo(60, 80)
      ..lineTo(60, 0)
      ..lineTo(0, -80)
      ..close();
    canvas.drawPath(path, paint);
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    path
      ..moveTo(0, 0)
      ..lineTo(-60, 80)
      ..lineTo(-60, 0)
      ..lineTo(0, -80);
    canvas.drawPath(path, paint);
  }
}
