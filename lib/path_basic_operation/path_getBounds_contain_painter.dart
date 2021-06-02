import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathGetBoundsContainPainter extends CustomPainter {
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
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill;

    path
      ..relativeLineTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    canvas.drawPath(path, paint);

    // 判断点offset是否在路径内
    print(path.contains(Offset(20, 20)));
    print(path.contains(Offset(0, 20)));

    // 获取当前路径所在的矩形区域
    Rect bounds = path.getBounds();

    canvas.drawRect(
        bounds,
        Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);
  }
}
