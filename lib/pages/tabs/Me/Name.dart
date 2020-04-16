import 'package:app01/pages/tabs/res/colors.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  NamePage({Key key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
        
        title: Text('修改昵称'),
        actions: <Widget>[
          RaisedButton(onPressed: (){
            
          },
          color: Colors.green[200],
          child: Text('完成'),)
        ],
      ),
      body: TextField(
      )
    );
  }
}