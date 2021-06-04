import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawCurvePathPainter extends CustomPainter {
  final List<Offset> points = [];
  final double step = 60;
  final double min = -240;
  final double max = 240;

  final double stepPolar = 6;
  final double minPolar = -240;
  final double maxPolar = 240;

  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // initPoints();
    initPointsWithPolar();
    Offset p1 = points[0];
    Path path = Path()..moveTo(p1.dx, p1.dy);
    for (var i = 1; i < points.length - 1; i++) {
      double xc = (points[i].dx + points[i + 1].dx) / 2;
      double yc = (points[i].dy + points[i + 1].dy) / 2;
      Offset p2 = points[i];
      path.quadraticBezierTo(p2.dx, p2.dy, xc, yc);
    }

    canvas.drawPath(path, paint);
  }

  void initPoints() {
    for (double x = min; x <= max; x++) {
      points.add(Offset(x, f(x)));
    }
  }

  double f(double x) {
    double y = -x * x / 200 + 100;
    return y;
  }

  initPointsWithPolar() {
    for (double x = minPolar; x <= maxPolar; x += stepPolar) {
      double thta = (pi / 180 * x); // 角度转化为弧度
      var p = fPolar(thta);
      points.add(Offset(p * cos(thta), p * sin(thta)));
    }
  }

  double fPolar(double thta) {
    // double p = 10 * thta;
    // double p = 100*(1-cos(thta));
    // double p = 150 * sin(5 * thta).abs();
    double p =
        50 * (pow(e, cos(thta)) - 2 * cos(4 * thta) + pow(sin(thta / 12), 5));
    return p;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }
}
