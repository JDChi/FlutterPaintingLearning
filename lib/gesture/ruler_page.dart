import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/gesture/ruler_painter.dart';

const double _kStrokeWidth = 2; // 刻度宽
const double _kSpacer = 4; // 刻度间隙

class RulerPage extends StatefulWidget {
  const RulerPage({Key key}) : super(key: key);

  @override
  _RulerPageState createState() => _RulerPageState();
}

class _RulerPageState extends State<RulerPage> {
  ValueNotifier<double> _dx = ValueNotifier(0.0);
  final double sizeW = 240;
  final double sizeH = 60;
  final int min = 100;
  final int max = 200;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanUpdate: parser,
          child: CustomPaint(
            painter: RulerPainter(min: min, max: max, dx: _dx),
            size: Size(sizeW, sizeH),
          ),
        ),
      ),
    );
  }

  double dx = 0;

  void parser(DragUpdateDetails details) {
    dx += details.delta.dx;
    if (dx > 0) {
      dx = 0.0;
    }

    var limitMax = -(max - min) * (_kSpacer + _kStrokeWidth);
    if (dx < limitMax) {
      dx = limitMax;
    }
    _dx.value = dx;
  }

  @override
  void dispose() {
    _dx.dispose();
    super.dispose();
  }
}
