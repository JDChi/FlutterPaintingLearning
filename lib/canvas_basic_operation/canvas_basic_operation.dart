import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/canvas_basic_operation/canvas_draw_dr_rect_painter.dart';
import 'package:flutter_painting_learning/canvas_basic_operation/canvas_rotate_painter.dart';
import 'package:flutter_painting_learning/canvas_basic_operation/canvas_scale_grid_painter.dart';

import 'canvas_translate_painter.dart';

const String canvas_translate = "canvas_translate";
const String canvas_scale_grid = "canvas_scale_grid";
const String canvas_rotate = "canvas_rotate";
const String canvas_draw_dr_rect = "canvas_draw_dr_rect";

class CanvasBasicOperation extends StatefulWidget {
  const CanvasBasicOperation({Key key}) : super(key: key);

  @override
  _CanvasBasicOperationState createState() => _CanvasBasicOperationState();
}

class _CanvasBasicOperationState extends State<CanvasBasicOperation> {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    super.initState();
  }

  CustomPainter getPainter() {
    switch (key) {
      case canvas_translate:
        return CanvasTranslatePainter();
      case canvas_scale_grid:
        return CanvasScaleGridPainter();
      case canvas_rotate:
        return CanvasRotatePainter();
      case canvas_draw_dr_rect:
        return CanvasDrawDRRectPainter();
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
              painter: BackGroundGridPainter(),
              foregroundPainter: getPainter(),
            ),
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = canvas_translate;
                    });
                  },
                  child: Text(canvas_translate)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = canvas_scale_grid;
                    });
                  },
                  child: Text(canvas_scale_grid)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = canvas_rotate;
                    });
                  },
                  child: Text(canvas_rotate)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = canvas_draw_dr_rect;
                    });
                  },
                  child: Text(canvas_draw_dr_rect))
            ],
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
