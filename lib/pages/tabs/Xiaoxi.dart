import 'package:flutter/material.dart';

class XiaoxiPage extends StatefulWidget {
  XiaoxiPage({Key key}) : super(key: key);

  @override
  _XiaoxiPageState createState() => _XiaoxiPageState();
}

class _XiaoxiPageState extends State<XiaoxiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/login');
          }
        ),
      ),
    );
  }
}