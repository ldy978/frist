import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';
class shiwuPage extends StatefulWidget {
  shiwuPage({Key key}) : super(key: key);

  @override
  _shiwuPageState createState() => _shiwuPageState();
}

class _shiwuPageState extends State<shiwuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
          '失物招领',
          style: MTextStyles.textBoldDark20,
        ),
      ),);
  }
}