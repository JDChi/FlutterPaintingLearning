import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_arc_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_arc_to_point_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_close_reset_shift_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_combine_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_compute_metrics_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_conic_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_cubic_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_getBounds_contain_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_move_and_line_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_relative_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_transform_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/quadratic_bezier_to_painter.dart';

const String path_move_and_line = "path_move_and_line";
const String path_relative_to = "path_relative_to";
const String path_arc_to = "path_arc_to";
const String path_arc_to_point = "path_arc_to_point";
const String path_conic_to = "path_conic_to";
const String path_quadratic_bezier_to = "path_quadratic_bezier_to";
const String path_cubic_to = "path_cubic_to";
const String path_close_reset_shift = "path_close_reset_shift";
const String path_getBounds_contain = "path_getBounds_contain";
const String path_transform = "path_transform";
const String path_combine = "path_combine";
const String path_compute_metrics = "path_compute_metrics";

class PathBasicOperation extends StatefulWidget {
  const PathBasicOperation({Key key}) : super(key: key);

  @override
  _PathBasicOperationState createState() => _PathBasicOperationState();
}

class _PathBasicOperationState extends State<PathBasicOperation>
    with TickerProviderStateMixin {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";
  AnimationController pathComputeMetricsController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    pathComputeMetricsController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    super.initState();
  }

  CustomPainter getPainter() {
    pathComputeMetricsController.reset();
    switch (key) {
      case path_move_and_line:
        return PathMoveAndLinePainter();
      case path_relative_to:
        return PathRelativeToPainter();
      case path_arc_to:
        return PathArcToPainter();
      case path_arc_to_point:
        return PathArcToPointPainter();
      case path_conic_to:
        return PathConicToPainter();
      case path_quadratic_bezier_to:
        return PathQuadraticBezierToPainter();
      case path_cubic_to:
        return PathCubicToPainter();
      case path_close_reset_shift:
        return PathCloseResetShiftPainter();
      case path_getBounds_contain:
        return PathGetBoundsContainPainter();
      case path_transform:
        return PathTransformPainter();
      case path_combine:
        return PathCombinePainter();
      case path_compute_metrics:
        pathComputeMetricsController.forward();
        return PathComputeMetricsPainter(
            progress: pathComputeMetricsController);
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
                            key = path_move_and_line;
                          });
                        },
                        child: Text(path_move_and_line)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_relative_to;
                          });
                        },
                        child: Text(path_relative_to)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_arc_to;
                          });
                        },
                        child: Text(path_arc_to)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_arc_to_point;
                          });
                        },
                        child: Text(path_arc_to_point)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_conic_to;
                          });
                        },
                        child: Text(path_conic_to)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_quadratic_bezier_to;
                          });
                        },
                        child: Text(path_quadratic_bezier_to)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_cubic_to;
                          });
                        },
                        child: Text(path_cubic_to)),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_close_reset_shift;
                          });
                        },
                        child: Text(path_close_reset_shift)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_getBounds_contain;
                          });
                        },
                        child: Text(path_getBounds_contain)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_transform;
                          });
                        },
                        child: Text(path_transform)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_combine;
                          });
                        },
                        child: Text(path_combine)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            key = path_compute_metrics;
                          });
                        },
                        child: Text(path_compute_metrics)),
                  ],
                )
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
    pathComputeMetricsController.dispose();
    super.dispose();
  }
}
