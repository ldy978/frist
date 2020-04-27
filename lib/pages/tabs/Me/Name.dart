import 'package:app01/pages/tabs/res/colors.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  NamePage({Key key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //底部阴影
          centerTitle: true,
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

          title: Text('修改昵称'),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                print(_controller.text);
              },
              color: Colors.green[200],
              child: Text('完成'),
            )
          ],
        ),
        body: Padding(padding: EdgeInsets.all(20),
        child: TextField(
          controller: _controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              hintText: "请输入昵称",
              hintStyle: TextStyle(color: Colors.black),
              // icon: Icon(
              //   Icons.local_activity,
              //   color: Colors.black,
              // )),
          ),
        )
    ));
  }
}
