import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/animation/pic_man_painter2.dart';

class PicManPage2 extends StatefulWidget {
  const PicManPage2({Key key}) : super(key: key);

  @override
  _PicManPage2State createState() => _PicManPage2State();
}

class _PicManPage2State extends State<PicManPage2>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final ValueNotifier<Color> _color = ValueNotifier(Colors.blue);

  @override
  void initState() {
    _controller = AnimationController(
      lowerBound: 10,
      upperBound: 40,
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _controller
      ..addStatusListener(_statusListener)
      ..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            _controller..reset()..forward();
          },
          child: Center(
      child: CustomPaint(
          painter: PicManPainter2(
              repaint: Listenable.merge([_controller, _color]),
              color: _color,
              angle: _controller),
          size: Size(100, 100),
      ),
    ),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _color.dispose();
    super.dispose();
  }

  void _statusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
        _color.value = Colors.black;
        break;
      case AnimationStatus.forward:
        _color.value = Colors.blue;
        break;
      case AnimationStatus.reverse:
        _color.value = Colors.red;
        break;
      case AnimationStatus.completed:
        _color.value = Colors.green;
        break;
    }
  }
}
