import 'package:flutter/material.dart';

class shibiePage extends StatefulWidget {
  shibiePage({Key key}) : super(key: key);

  @override
  _shibiePageState createState() => _shibiePageState();
}

class _shibiePageState extends State<shibiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 10,
      backgroundColor: Colors.green,
      title: Text(
        "人脸识别",
      ),
      centerTitle: true,
    ));
  }
}
