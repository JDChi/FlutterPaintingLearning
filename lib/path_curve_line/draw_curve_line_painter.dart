import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawCurveLinePainter extends CustomPainter {
  final List<Offset> points = [];
  final double step = 10;
  final double min = -240;
  final double max = 240;

  final double stepPolar = 3;
  final double minPolar = 0;
  final double maxPolar = 360 * 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    // 绘制点集，这样意味着要记录很多的点
    // initPoints();
    // canvas.drawPoints(PointMode.points, points, paint);
    // 可以通过适当地增加步长，并使用 PointMode.polygon ，以减少点的记录
    // initPolyPoints();
    // canvas.drawPoints(PointMode.polygon, points, paint);
    initPointsWithPolar();
    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  void initPolyPoints() {
    for (double x = min; x <= max; x += step) {
      points.add(Offset(x, f(x)));
    }
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
    // double p = 150*sin(5*thta).abs();
    double p = 50*(pow(e,cos(thta)) - 2 * cos(4 * thta) +pow(sin(thta / 12), 5));
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
