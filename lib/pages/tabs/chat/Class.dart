import 'package:app01/pages/tabs/chat/gridview2.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  ClassPage({Key key}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final MyGridView2 myGridView = MyGridView2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //顶部应用按钮组件
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
          "班级陌陌",
          style: MTextStyles.textBoldDark16,
        ),
        centerTitle: true,
      ),
      body: myGridView.build(context),
    );
  }
}
