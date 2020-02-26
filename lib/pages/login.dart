import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller_user = new TextEditingController();
  final TextEditingController _controller_pwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           image:DecorationImage(
             image:AssetImage("images/bg.jpg"),
             fit:BoxFit.cover,
           ),
         ),
         child: ListView(
           padding: EdgeInsets.symmetric(horizontal:22.0 ),
           children: <Widget>[
             SizedBox(
               height: 280.0,
             ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20.0),
               child: TextField(
                 keyboardType: TextInputType.number,
                 style:TextStyle(color: Colors.black),
                 controller:  _controller_user,
                 decoration: InputDecoration(
                   hintText: "请输入学工号",
                   hintStyle: TextStyle(color: Colors.black),
                   border: InputBorder.none,
                   icon: Icon(Icons.person,color: Colors.black)),
                   inputFormatters: <TextInputFormatter>[
                     WhitelistingTextInputFormatter.digitsOnly,//只输入数字
                     LengthLimitingTextInputFormatter(8)//限制长度

                   ],
             )),
               Container(
                 child: Divider(
                   color: Colors.black,
                 ),
                 padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _controller_pwd,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "请输入密码",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                    obscureText: true,
                  )),
              Container(
                child: Divider(
                  color: Colors.black,
                ),
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              ),
              Container(
                height: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () async {
                      print("login");
                      print(_controller_user.text);
                      print(_controller_pwd.text);
                      if (_controller_user.text.length != 0 &&
                          _controller_pwd.text.length != 0) {
                        Toast.show("正在登录中...", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                        print("执行登录代码");

                        FormData params = new FormData.from({
                          'name': _controller_user.text,
                          'pasd': _controller_pwd.text,
                          'numb': 'mxxzx'
                        });

                        Dio dio = new Dio();
                        Response response = await dio.post(
                            "https://xxzx.bjtuhbxy.edu.cn/login/main",
                            data: params);

                        if (response.statusCode == 200) {
                          if (json.decode(response.data)["login_flag"] == 1) {
                            //登录成功
                            final prefs = await SharedPreferences.getInstance();
                            print("XCCCCCCCCCCCCCCCCCCCC" +
                                response.data.toString());
                            prefs.setString('account',
                                json.decode(response.data)["account"]);
                            prefs.setString(
                                'secret', json.decode(response.data)["secret"]);
                            prefs.setString(
                                'name', json.decode(response.data)["name"]);
                            print(prefs.getString("name"));
                          } else {
                            // Toast.show(json.decode(response.data)["error"], context,
                            // duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                          }
                        } else {
                          print("HHERROR" + response.statusCode.toString());
                        }
                      } else {
                        Toast.show("用户名和密码均不能为空", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child:
                        Text("Login", style: TextStyle(color: Colors.white70)),
                    color: Colors.pink,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class Dio {
  post(String s, {FormData data}) {}
}