import 'dart:ui';

import 'package:flutter/animation.dart';

class ColorDouble {
  final Color color;
  final double value;

  ColorDouble({this.color, this.value});
}

class ColorDoubleTween extends Tween<ColorDouble> {
  ColorDoubleTween({ColorDouble begin, ColorDouble end})
      : super(begin: begin, end: end);

  @override
  ColorDouble lerp(double t) {
    return ColorDouble(
        color: Color.lerp(begin.color, end.color, t),
        value: (begin.value + (end.value - begin.value) * t));
  }
}
