import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_painting_learning/canvas_color_operation/color_ball.dart';
import 'package:flutter_painting_learning/canvas_color_operation/color_image_paint_painter.dart';
import 'package:image/image.dart' as image;

class ImageBallPage extends StatefulWidget {
  const ImageBallPage({Key key}) : super(key: key);

  @override
  _ImageBallPageState createState() => _ImageBallPageState();
}

class _ImageBallPageState extends State<ImageBallPage> {
  image.Image _image;
  List<ColorBall> balls = [];
  double d = 5;

  @override
  void initState() {
    _initBalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(painter: ColorImagePaintPainter(balls: balls)),
    );
  }

  void _initBalls() async {
    _image = await loadImageFromAssets("images/test1.jpg");

    for (int i = 0; i < _image.width; i++) {
      for (int j = 0; j < _image.height; j++) {
        ColorBall colorBall = ColorBall();
        colorBall.x = i * d + d / 2;
        colorBall.y = j * d + d / 2;
        colorBall.r = d / 2;
        var color = Color(_image.getPixel(i, j));
        colorBall.color =
            Color.fromARGB(color.alpha, color.blue, color.green, color.red);
        balls.add(colorBall);
      }
    }
    setState(() {});
  }

  Future<image.Image> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return image.decodeImage(bytes);
  }
}
