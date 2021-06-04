import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/path_curve_line/draw_curve_line_painter.dart';
import 'package:flutter_painting_learning/path_curve_line/draw_curve_path_painter.dart';
import 'package:flutter_painting_learning/path_curve_line/draw_curve_path_run_painter.dart';

const String draw_curve_line = "draw_curve_line";
const String draw_curve_path = "draw_curve_path";
const String draw_curve_path_run = "draw_curve_path_run";

class PathCurveLine extends StatefulWidget {
  const PathCurveLine({Key key}) : super(key: key);

  @override
  _PathCurveLineState createState() => _PathCurveLineState();
}

class _PathCurveLineState extends State<PathCurveLine>
    with TickerProviderStateMixin {
  String key = "";
  AnimationController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );
    super.initState();
  }

  CustomPainter getPainter() {
    switch (key) {
      case draw_curve_line:
        return DrawCurveLinePainter();
      case draw_curve_path:
        return DrawCurvePathPainter();
      case draw_curve_path_run:
        _controller
          ..reset()
          ..repeat();
        return DrawCurvePathRunPainter(repaint: _controller);
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
            child: CustomPaint(
              foregroundPainter: getPainter(),
              painter: BackGroundGridPainter(),
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
                            key = draw_curve_line;
                          });
                        },
                        child: Text(draw_curve_line)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = draw_curve_path;
                          });
                        },
                        child: Text(draw_curve_path)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = draw_curve_path_run;
                          });
                        },
                        child: Text(draw_curve_path_run))
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
    super.dispose();
  }
}
