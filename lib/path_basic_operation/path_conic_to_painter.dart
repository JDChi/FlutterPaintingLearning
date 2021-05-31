import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathConicToPainter extends CustomPainter {
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
    final Offset p1 = Offset(80, -100);
    final Offset p2 = Offset(160, 0);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // w 表示权重 < 1 曲线为椭圆形 ， = 1 为抛物线 ，> 1 是双曲线
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(-180, 0);
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 0.5);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(360, 0);
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);

    canvas.drawPath(path, paint);
  }
}
