import 'package:flutter/material.dart';
import 'package:flutter_painting_learning/canvas_basic_operation/canvas_basic_operation.dart';
import 'package:flutter_painting_learning/path_basic_operation/path_basic_operation.dart';

const String canvas_basic_operation = "canvas_basic_operation";
const String path_basic_operation = "path_basic_operation";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        canvas_basic_operation: (context) => CanvasBasicOperation(),
        path_basic_operation: (context) => PathBasicOperation()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, canvas_basic_operation);
                },
                child: Text("canvas_basic_operation")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, path_basic_operation);
                },
                child: Text("path_basic_operation")),
          ],
        ),
      ),
    );
  }
}