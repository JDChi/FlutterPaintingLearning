import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandlePainter extends CustomPainter {
  var _paint = Paint();
  double handleR;
  final ValueNotifier<Offset> offset;
  final Color color;

  HandlePainter({this.handleR, this.offset, this.color = Colors.blue})
      : super(repaint: offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final bgR = size.width / 2 - handleR;
    canvas.translate(size.width / 2, size.height / 2);
    _paint.style = PaintingStyle.fill;
    _paint.color = _paint.color.withAlpha(100);
    canvas.drawCircle(Offset.zero, bgR, _paint);
    _paint.color = _paint.color.withAlpha(150);
    canvas.drawCircle(
        Offset(offset.value.dx, offset.value.dy), handleR, _paint);
    _paint.color = color;
    _paint.style = PaintingStyle.stroke;
    canvas.drawLine(Offset.zero, offset.value, _paint);
  }

  @override
  bool shouldRepaint(covariant HandlePainter oldDelegate) {
    return oldDelegate.handleR != handleR ||
        oldDelegate.offset != offset ||
        oldDelegate.color != color;
  }
}
