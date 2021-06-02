import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/image_ball_page.dart';
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

const String color_image_paint = "color_image_paint";

class ColorBasicOperation extends StatefulWidget {
  const ColorBasicOperation({Key key}) : super(key: key);

  @override
  _ColorBasicOperationState createState() => _ColorBasicOperationState();
}

class _ColorBasicOperationState extends State<ColorBasicOperation>
    with TickerProviderStateMixin {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ImageBallPage();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
