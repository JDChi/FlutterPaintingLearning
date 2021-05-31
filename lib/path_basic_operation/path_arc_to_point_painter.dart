import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathArcToPointPainter extends CustomPainter {
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
    path..lineTo(80, -40);
    // largeArc : 是否使用优弧，大于半圆的弧叫优弧，小于半圆的弧叫做劣弧。
    path
      ..arcToPoint(Offset(40, 40), radius: Radius.circular(60), largeArc: false)
      ..close();
    canvas.drawPath(path, paint);
    path.reset();

    canvas.translate(-150, 0);
    path
      ..lineTo(80, -40)
      ..arcToPoint(Offset(40, 40),
          radius: Radius.circular(60), largeArc: true, clockwise: false)
      ..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(300, 0);
    path
      ..lineTo(80, -40)
      ..arcToPoint(Offset(40, 40), radius: Radius.circular(60), largeArc: true)
      ..close();

    canvas.drawPath(path, paint);
  }
}
