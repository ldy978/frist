import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
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
      appBar: AppBar(
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
      title: Text(
        "消息",
        style: MTextStyles.textBoldDark16,
      ),
      centerTitle: true,
     ),
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