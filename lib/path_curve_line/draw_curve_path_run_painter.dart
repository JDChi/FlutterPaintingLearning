import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawCurvePathRunPainter extends CustomPainter {
  final List<Offset> points = [];
  final double step = 60;
  final double min = -240;
  final double max = 240;

  final double stepPolar = 4;
  final double minPolar = -240;
  final double maxPolar = 240;

  final Animation<double> repaint;

  DrawCurvePathRunPainter({this.repaint}) : super(repaint: repaint) {
    // initPoints();
    initPointsWithPolar();
  }

  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    Offset p1 = points[0];
    Path path = Path()..moveTo(p1.dx, p1.dy);
    for (var i = 1; i < points.length - 1; i++) {
      double xc = (points[i].dx + points[i + 1].dx) / 2;
      double yc = (points[i].dy + points[i + 1].dy) / 2;
      Offset p2 = points[i];
      path.quadraticBezierTo(p2.dx, p2.dy, xc, yc);
    }

    // canvas.drawPath(path, paint);

    // 绘制小球沿着path运动
    // PathMetrics pms = path.computeMetrics();
    // pms.forEach((pm) {
    //   Tangent tangent = pm.getTangentForOffset(pm.length * repaint.value);
    //   canvas.drawCircle(tangent.position, 5, Paint()..color = Colors.blue);
    // });

    PathMetrics pms = path.computeMetrics();
    pms.forEach((pm) {
      Tangent tangent = pm.getTangentForOffset(pm.length * repaint.value);
      // 提取路径绘制
      canvas.drawPath(pm.extractPath(0, pm.length * repaint.value), paint);
      canvas.drawCircle(
          tangent.position, 5, Paint()..color = Colors.blue);
    });
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
    double thta = (pi / 180 * max);
    points.add(Offset(f(thta) * cos(thta), f(thta) * sin(thta)));
    points.add(Offset(f(thta) * cos(thta), f(thta) * sin(thta)));
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
  bool shouldRepaint(covariant DrawCurvePathRunPainter oldDelegate) {
    return oldDelegate.repaint != repaint;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }
}
