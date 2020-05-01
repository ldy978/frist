import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/chat/gridview3.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({Key key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  MyGridView3 myGridView = MyGridView3();
  List roomList = [];
  @override
  void initState() {
    super.initState();
    getHttp().then((val) {
      setState(() {
        roomList = val.toList();
      });
      
    });
  }

  getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid': Global.account};
      FormData formData = FormData.fromMap(map);
      response = await dio.post(
        Global.get_room,
        data: formData,
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

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
      body: myGridView.build(context, roomList),
    );
  }
}
