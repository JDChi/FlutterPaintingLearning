import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_arc_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_arc_to_point_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_conic_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_cubic_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_move_and_line_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_relative_to_painter.dart';
import 'package:flutter_painting_learning/path_basic_operation/quadratic_bezier_to_painter.dart';

const String path_move_and_line = "path_move_and_line";
const String path_relative_to = "path_relative_to";
const String path_arc_to = "path_arc_to";
const String path_arc_to_point = "path_arc_to_point";
const String path_conic_to = "path_conic_to";
const String path_quadratic_bezier_to = "path_quadratic_bezier_to";
const String path_cubic_to = "path_cubic_to";

class PathBasicOperation extends StatefulWidget {
  const PathBasicOperation({Key key}) : super(key: key);

  @override
  _PathBasicOperationState createState() => _PathBasicOperationState();
}

class _PathBasicOperationState extends State<PathBasicOperation> {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  CustomPainter getPainter() {
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
            child: Column(
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
                    child: Text(path_cubic_to))
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
    super.dispose();
  }
}
