import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/path_bezier/touch_info.dart';

class SimpleBezier3Painter extends CustomPainter {
  Offset p1 = Offset(100, 100);
  Offset p2 = Offset(120, -60);
  Paint _helpPaint = Paint();

  final TouchInfo repaint;

  SimpleBezier3Painter({this.repaint}) : super(repaint: repaint);
  List<Offset> pos;

  @override
  void paint(Canvas canvas, Size size) {
    _moveCanvasToCenter(canvas, size);
    Path path = Path();
    pos = repaint.points
        .map((e) => e.translate(-size.width / 2, -size.height / 2))
        .toList();

    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    if (pos.length < 4) {
      canvas.drawPoints(PointMode.points, pos, _helpPaint..strokeWidth = 8);
    } else {
      path
        ..moveTo(pos[0].dx, pos[0].dy)
        ..cubicTo(
            pos[1].dx, pos[1].dy, pos[2].dx, pos[2].dy, pos[3].dx, pos[3].dy);

      canvas.drawPath(path, paint);
      _drawHelper(canvas);
      _drawSelectPos(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant SimpleBezier3Painter oldDelegate) {
    return oldDelegate.repaint != repaint;
  }

  void _moveCanvasToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  /// 绘制辅助线
  void _drawHelper(Canvas canvas) {
    // _helpPaint
    //   ..color = Colors.purple
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round;
    //
    // canvas.drawPoints(PointMode.lines, [Offset.zero, p1, p1, p2], _helpPaint);
    // canvas.drawPoints(PointMode.points, [Offset.zero, p1, p1, p2],
    //     _helpPaint..strokeWidth = 8);

    _helpPaint..color = Colors.purple;
    canvas.drawPoints(PointMode.polygon, pos, _helpPaint..strokeWidth = 1);
    canvas.drawPoints(PointMode.points, pos, _helpPaint..strokeWidth = 8);
  }

  void _drawSelectPos(Canvas canvas, Size size) {
    Offset selectPos = repaint.selectPoint;
    if (selectPos == null) return;
    selectPos = selectPos.translate(-size.width / 2, -size.height / 2);
    canvas.drawCircle(
        selectPos,
        10,
        _helpPaint
          ..color = Colors.green
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke);
  }
}
