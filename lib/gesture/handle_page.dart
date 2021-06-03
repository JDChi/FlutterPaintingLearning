import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/gesture/handle_painter.dart';

class HandlePage extends StatefulWidget {
  const HandlePage({Key key}) : super(key: key);

  @override
  _HandlePageState createState() => _HandlePageState();
}

class _HandlePageState extends State<HandlePage> {
  ValueNotifier<Offset> _offset = ValueNotifier(Offset.zero);
  final double size = 160;
  final double handleR = 20.0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Transform.rotate(
              angle: angle,
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ),
            GestureDetector(
              onPanEnd: reset,
              onPanUpdate: parser,
              child: CustomPaint(
                painter: HandlePainter(
                    handleR: handleR, color: Colors.green, offset: _offset),
                size: Size(size, size),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reset(DragEndDetails details) {
    _offset.value = Offset.zero;
    setState(() {
      angle = 0;
    });
  }

  void parser(DragUpdateDetails details) {
    final offset = details.localPosition;
    double dx = 0.0;
    double dy = 0.0;
    dx = offset.dx - size / 2;
    dy = offset.dy - size / 2;
    double rad = atan2(dx, dy);
    if (dx < 0) {
      rad += 2 * pi;
    }

    // 背景大圆的半径
    double bgR = size / 2 - handleR;
    double thta = rad - pi / 2; // 旋转坐标系90度
    double d = sqrt(dx * dx + dy * dy);
    if (d > bgR) {
      dx = bgR * cos(thta);
      dy = -bgR * sin(thta);
    }

    _offset.value = Offset(dx, dy);

    setState(() {
      angle = -thta;
    });
  }

  @override
  void dispose() {
    _offset.dispose();
    super.dispose();
  }
}
