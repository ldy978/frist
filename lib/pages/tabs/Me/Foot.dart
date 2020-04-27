import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class FootPage extends StatefulWidget {
  FootPage({Key key}) : super(key: key);

  @override
  _FootPageState createState() => _FootPageState();
}

class _FootPageState extends State<FootPage> {
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
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: MColors.text_dark,
        ),
      ),
      title: Text(
        "我的足迹",
        style: MTextStyles.textBoldDark16,
      ),
      centerTitle: true,
    ));
  }
}
