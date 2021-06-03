import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/background_grid_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/color_filter_matrix_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/color_filter_mode_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/image_filter_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/mask_filter_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_linear_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_radial_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_gradient_sweep_painter.dart';
import 'package:flutter_painting_learning/canvas_color_operation/shader_image_shader_painter.dart';
import 'dart:ui' as ui;

const String shader_gradient_linear = "shader_gradient_linear";
const String shader_gradient_radial = "shader_gradient_radial";
const String shader_gradient_sweep = "shader_gradient_sweep";
const String shader_image_shader = "shader_image_shader";
const String color_filter_mode = "color_filter_mode";
const String color_filter_matrix = "color_filter_matrix";
const String mask_filter = "mask_filter";
const String image_filter = "image_filter";

class ColorBasicOperation1 extends StatefulWidget {
  const ColorBasicOperation1({Key key}) : super(key: key);

  @override
  _ColorBasicOperation1State createState() => _ColorBasicOperation1State();
}

class _ColorBasicOperation1State extends State<ColorBasicOperation1> {
  Map<String, CustomPainter> painterMap = Map();
  String key = "";
  ui.Image image;

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
      case shader_image_shader:
        return ShaderImageShaderPainter(image: image);
      case color_filter_mode:
        return ColorFilterModePainter(image: image);
      case color_filter_matrix:
        return ColorFilterMatrixPainter(image: image);
      case mask_filter:
        return MaskFilterPainter(image: image);
      case image_filter:
        return ImageFilterPainter(image: image);
    }
    return null;
  }

  Future<ui.Image> loadImage(ImageProvider provider) {
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener listener;
    ImageStream stream = provider.resolve(ImageConfiguration());
    listener = ImageStreamListener((info, syno) {
      final ui.Image image = info.image; //监听图片流，获取图片
      completer.complete(image);
      stream.removeListener(listener);
    });
    stream.addListener(listener);
    return completer.future;
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
          SingleChildScrollView(
            child: Column(
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
                TextButton(
                    onPressed: () {
                      setState(() {
                        key = shader_image_shader;
                        _loadImage();
                      });
                    },
                    child: Text(shader_image_shader)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        key = color_filter_mode;
                        _loadImage();
                      });
                    },
                    child: Text(color_filter_mode)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        key = color_filter_matrix;
                        _loadImage();
                      });
                    },
                    child: Text(color_filter_matrix)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        key = mask_filter;
                        _loadImage();
                      });
                    },
                    child: Text(mask_filter)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        key = image_filter;
                        _loadImage();
                      });
                    },
                    child: Text(image_filter)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _loadImage() async {
    image = await loadImage(AssetImage('images/test1.jpg'));
    setState(() {});
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
