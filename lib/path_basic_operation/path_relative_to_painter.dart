import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathRelativeToPainter extends CustomPainter {
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
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo(60, -10)
      ..close();
    canvas.drawPath(path, paint);
    path.reset();
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.green;
    path
      ..relativeMoveTo(-200, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo(60, -10)
      ..close();
    canvas.drawPath(path, paint);
  }
}
