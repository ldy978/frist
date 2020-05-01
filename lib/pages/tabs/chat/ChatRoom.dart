import 'package:app01/pages/tabs/chat/gridview3.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({Key key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final MyGridView3 myGridView = MyGridView3();

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
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MColors.text_dark,
          ),
        ),
        title: Text(
          "校园陌陌",
          style: MTextStyles.textBoldDark16,
        ),
        centerTitle: true,
        actions: <Widget>[
          //图标按钮
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '创建',
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/createroom');
            },
          ),
        ],
      ),
      body: myGridView.build(context),
    );
  }
}
