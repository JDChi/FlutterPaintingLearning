import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_linear_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_radial_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_sweep_painter.dart';

const String shader_gradient_linear = "shader_gradient_linear";
const String shader_gradient_radial = "shader_gradient_radial";
const String shader_gradient_sweep = "shader_gradient_sweep";

class ColorBasicOperation1 extends StatefulWidget {
  const ColorBasicOperation1({Key key}) : super(key: key);

  @override
  _ColorBasicOperation1State createState() => _ColorBasicOperation1State();
}

class _ColorBasicOperation1State extends State<ColorBasicOperation1> {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  CustomPainter getPainter() {
    switch (key) {
      case shader_gradient_linear:
        return ShaderGradientLinearPainter();
      case shader_gradient_radial:
        return ShaderGradientRadialPainter();
      case shader_gradient_sweep:
        return ShaderGradientSweepPainter();
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
                      key = shader_gradient_linear;
                    });
                  },
                  child: Text(shader_gradient_linear)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = shader_gradient_radial;
                    });
                  },
                  child: Text(shader_gradient_radial)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      key = shader_gradient_sweep;
                    });
                  },
                  child: Text(shader_gradient_sweep)),
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
