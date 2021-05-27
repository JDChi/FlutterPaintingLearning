import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasRotatePainter extends CustomPainter {
  Paint _gridPaint;
  final double step = 20;
  final double strokeWidth = .5;
  final Color color = Colors.grey;

  CanvasRotatePainter() {
    _gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 画布的起点移到屏幕中心
    canvas.translate(size.width / 2, size.height / 2);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.drawLine(
        Offset(20, 20),
        Offset(50, 50),
        paint
          ..color = Colors.red
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);
    _drawGrid(canvas, size);
    _drawDot(canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawDot(Canvas canvas, Paint paint) {
    final int count = 12;
    paint
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    canvas.save();
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);
    canvas.save();
    // 沿x轴镜像
    canvas.scale(1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    // 沿y轴镜像
    canvas.scale(-1, 1);
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    // 沿原点镜像
    canvas.scale(-1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  /// 画右下角部分的宫格
  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset.zero, Offset(size.width / 2, 0), _gridPaint);
      // 画布下移
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset.zero, Offset(0, size.height / 2), _gridPaint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }
}
