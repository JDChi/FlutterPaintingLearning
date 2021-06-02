import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathComputeMetricsPainter extends CustomPainter {
  final Animation<double> progress;

  PathComputeMetricsPainter({this.progress}) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    _drawLine(canvas);
  }

  @override
  bool shouldRepaint(covariant PathComputeMetricsPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  void _drawLine(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path
      ..relativeLineTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();

    path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));

    // 计算路径的测量信息
    PathMetrics pms = path.computeMetrics();
    pms.forEach((element) {
      Tangent tangent =
          element.getTangentForOffset(element.length * progress.value);

      canvas.drawCircle(
          tangent.position, 5, Paint()..color = Colors.deepOrange);
    });

    canvas.drawPath(path, paint);
  }
}
