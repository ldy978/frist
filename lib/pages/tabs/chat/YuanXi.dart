import 'package:app01/pages/tabs/chat/gridview1.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:flutter/material.dart';

class YuanXiPage extends StatefulWidget {
  YuanXiPage({Key key}) : super(key: key);

  @override
  _YuanXiPageState createState() => _YuanXiPageState();
}

class _YuanXiPageState extends State<YuanXiPage> {
  final MyGridView1 myGridView = MyGridView1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //顶部应用按钮组件
        //底部阴影
        elevation: 0.0,
        backgroundColor: Colors.green,
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
          "院系陌陌",
        ),
        centerTitle: true,
      ),
      body: myGridView.build(context),
    );
  }
}
