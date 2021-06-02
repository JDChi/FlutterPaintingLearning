import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathCombinePainter extends CustomPainter {
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

    var pathOval = Path()
      ..addOval(Rect.fromCenter(center: Offset.zero, width: 60, height: 60));
    canvas.drawPath(
        Path.combine(PathOperation.difference, path, pathOval), paint);

    canvas.translate(120, 0);
    canvas.drawPath(
        Path.combine(PathOperation.intersect, path, pathOval), paint);

    canvas.translate(120, 0);
    canvas.drawPath(Path.combine(PathOperation.union, path, pathOval), paint);

    canvas.translate(-120 * 3.0, 0);
    canvas.drawPath(
        Path.combine(PathOperation.reverseDifference, path, pathOval), paint);

    canvas.translate(-120, 0);
    canvas.drawPath(Path.combine(PathOperation.xor, path, pathOval), paint);
  }
}
