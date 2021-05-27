import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasDrawDRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    var paint = Paint();
    _drawDRRect(canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDRRect(Canvas canvas, Paint paint) {
    paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect outRect =
        Rect.fromCenter(center: Offset.zero, width: 160, height: 160);
    Rect inRect = Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
    // 画两个圆角矩形之间的差异
    canvas.drawDRRect(RRect.fromRectXY(outRect, 20, 20),
        RRect.fromRectXY(inRect, 20, 20), paint);

    // Rect outRect2 = Rect.fromCenter(center: Offset.zero, width: 60, height: 60);
    // Rect inRect2 = Rect.fromCenter(center: Offset.zero, width: 40, height: 40);
    // canvas.drawDRRect(RRect.fromRectXY(outRect2, 15, 15),
    //     RRect.fromRectXY(inRect2, 10, 10), paint);
  }
}
