import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/path_bezier/bezier3_painter.dart';
import 'package:flutter_painting_learning/path_bezier/simple_bezier2_painter.dart';
import 'package:flutter_painting_learning/path_bezier/touch_info.dart';

const String simple_bezier2 = "simple_bezier2";
const String simple_bezier3 = "simple_bezier3";

class PathBezier extends StatefulWidget {
  const PathBezier({Key key}) : super(key: key);

  @override
  _PathBezierState createState() => _PathBezierState();
}

class _PathBezierState extends State<PathBezier> with TickerProviderStateMixin {
  String key = "";
  AnimationController _controller;
  final TouchInfo touchInfo = TouchInfo();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    super.initState();
  }

  CustomPainter getPainter() {
    touchInfo.clear();
    switch (key) {
      case simple_bezier2:
        return SimpleBezier2Painter(repaint: touchInfo);
      case simple_bezier3:
        return SimpleBezier3Painter(repaint: touchInfo);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onPanDown: _onPanDown,
              onPanUpdate: _onPanUpdate,
              child: CustomPaint(
                foregroundPainter: getPainter(),
                painter: BackGroundGridPainter(),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = simple_bezier2;
                          });
                        },
                        child: Text(simple_bezier2)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = simple_bezier3;
                          });
                        },
                        child: Text(simple_bezier3)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.dispose();
    touchInfo.dispose();
    super.dispose();
  }

  void _onPanDown(DragDownDetails details) {
    if(key == simple_bezier2){
      if (touchInfo.points.length < 3) {
        touchInfo.addPoint(details.localPosition);
      } else {
        judgeZone(details.localPosition);
      }
    }else if(key == simple_bezier3){
      if (touchInfo.points.length < 4) {
        touchInfo.addPoint(details.localPosition);
      } else {
        judgeZone(details.localPosition);
      }
    }

  }

  void _onPanUpdate(DragUpdateDetails details) {
    judgeZone(details.localPosition, update: true);
  }

  void judgeZone(Offset src, {bool update = false}) {
    for (int i = 0; i < touchInfo.points.length; i++) {
      if (judgeCircleArea(src, touchInfo.points[i], 15)) {
        touchInfo.selectIndex = i;
        if (update) {
          touchInfo.updatePoint(i, src);
        }
      }
    }
  }

  /// 是否在某点的半径为r的范围内
  bool judgeCircleArea(Offset src, Offset dst, int r) {
    return (src - dst).distance <= r;
  }
}
