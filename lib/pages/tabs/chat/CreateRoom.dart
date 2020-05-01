import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/customview.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
  //房间名的控制器
  TextEditingController nameController = TextEditingController();
  TextEditingController introController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
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
            Navigator.pop(context);
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
                onPressed: () async {
                  if (nameController.text.length != 0) {
                    print("房间名称" + nameController.text);
                    print('房间简介' + introController.text);
                    print("私人房间" + _switchItemA.toString());
                    Dio dio = new Dio();
                        Map<String, String> map = {
                          'uid': Global.account,
                          'name': nameController.text.toString(),
                          'img_url':"https://bjtuhbxy.yeximm.com/__local/5/BC/16/3F870F1B06A8AE02D5DB1BE2311_A0FBFACC_FDD6.jpg",
                          'intro':introController.text.toString(),
                          'public':_switchItemA?'0':'1',
                          'password':_switchItemA?pwdController.text.toString():""
                        };
                        FormData formData = FormData.fromMap(map);
                        print(formData);
                        Response response = await dio.post(
                        Global.create_room,
                          data: formData,
                        );
                        if (response.statusCode == 200) {
                          print(response.toString());
                          if(response.data == 200){
                            Toast.show("创建房间成功", context);
                            Navigator.pop(context);
                          }
                        }
                  } else {
                    Toast.show("房间名称不能为空", context);
                  }
                },
                child: new Text(
                  "创建", 
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
            controller: nameController,
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
            controller: introController,
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
              '默认为公开房间,开启后需要密码才能加入',
            ),
            secondary:
                Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
            selected: _switchItemA,
          ),
          Gaps.vGap16,
          !_switchItemA
              ? Gaps.vGap16
              : TextField(
                  controller: pwdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    icon: Icon(Icons.lock),
                    labelText: '房间密码',
                  ),
                ),
        ],
      ),
    );
  }

  void onTextClear() {
    setState(() {
      nameController.clear();
      introController.clear();
      pwdController.clear();
    });
  }
}
