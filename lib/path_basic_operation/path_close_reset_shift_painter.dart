import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathCloseResetShiftPainter extends CustomPainter {
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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // close 将路径尾点和起点，进行路径封闭
    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -50)
      ..close();

    canvas.drawPath(path, paint);
    // shift 平移路径，返回一条新的路径
    canvas.drawPath(path.shift(Offset(100, 0)), paint);
    canvas.drawPath(path.shift(Offset(200, 0)), paint);
  }
}
