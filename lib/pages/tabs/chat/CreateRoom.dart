import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class CreateRoomPage extends StatefulWidget {
  CreateRoomPage({Key key}) : super(key: key);

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  // Widget buildTextField() {
  //   return TextField(
  //     decoration: InputDecoration(
  //         fillColor: Colors.blue.shade100,
  //         filled: true,
  //         prefixIcon: Icon(Icons.local_airport),
  //         suffixText: 'airport'),
  //   );
  // }
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();
  bool flag = false;
  bool _switchItemA = false;
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
            Navigator.pushNamed(context, '/chatroom');
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MColors.text_dark,
          ),
        ),
        title: Text(
          "创建房间",
          style: MTextStyles.textBoldDark16,
        ),
        centerTitle: true,
        actions: <Widget>[
          new Container(
              height: 50.0,
              width: 60.0,
              child: new RaisedButton(
                onPressed: () {},
                
                child: new Text("创建",
                  
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ))
        ],
      ),
      // body: Padding(padding: const EdgeInsets.all(30.0),
      // child:buildTextField(),),
      // body:myGridView.build(context),
      body: Column(
        children: <Widget>[
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.nature),
              labelText: '请输入房间名称',
            ),
            autofocus: false,
          ),
          Gaps.vGap16,
          Gaps.vGap16,
          TextField(
            controller: passController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.lightbulb_outline),
              labelText: '房间简介',
            ),
          ),
          Gaps.vGap16,
          Gaps.vGap16,
          SwitchListTile(
            value: _switchItemA,
            onChanged: (value) {
              setState(() {
                _switchItemA = value;
              });
            },
            title: Text(
              '私人房间',
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              '别人搜不到这个房间了，此选项不可修改',
            ),
            secondary:
                Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
            selected: _switchItemA,
          ),
        ],
      ),
    );
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }
}
