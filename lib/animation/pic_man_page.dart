import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/animation/pic_man_painter.dart';

class PicManPage extends StatefulWidget {
  const PicManPage({Key key}) : super(key: key);

  @override
  _PicManPageState createState() => _PicManPageState();
}

class _PicManPageState extends State<PicManPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomPaint(
        painter: PicManPainter(repaint: _controller),
        size: Size(100, 100),
      ),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
