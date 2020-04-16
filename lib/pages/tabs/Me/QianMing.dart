import 'package:app01/pages/tabs/res/colors.dart';
import 'package:flutter/material.dart';

class QianMingPage extends StatefulWidget {
  QianMingPage({Key key}) : super(key: key);

  @override
  _QianMingPageState createState() => _QianMingPageState();
}

class _QianMingPageState extends State<QianMingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //底部阴影
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.pushNamed(context, '/mine');
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MColors.text_dark,
          ),
        ),
        title: Text('修改个人签名'),
        actions: <Widget>[
          RaisedButton(onPressed: (){
            
          },
          color: Colors.green[200],
          child: Text('完成'),)
        ],
      ),
      body: TextField(),
    );
  }
}