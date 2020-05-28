import 'dart:convert';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class CreateTravelPage extends StatefulWidget {
  CreateTravelPage({Key key}) : super(key: key);

  @override
  _CreateTravelPageState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  final TextEditingController _controller_source = new TextEditingController();
  final TextEditingController _controller_destination =
      new TextEditingController();
  final TextEditingController _controller_checi = new TextEditingController();
  final TextEditingController _controller_time = new TextEditingController();
  final TextEditingController _controller_date = new TextEditingController();
  final TextEditingController _controller_phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: Text(
          "添加行程",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/travel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _controller_source,
                    decoration: InputDecoration(
                        hintText: "出发地",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.train, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(8) //限制长度
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
                    style: TextStyle(color: Colors.black),
                    controller: _controller_destination,
                    decoration: InputDecoration(
                        hintText: "目的地",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.train, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(8) //限制长度
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
                    style: TextStyle(color: Colors.black),
                    controller: _controller_checi,
                    decoration: InputDecoration(
                        hintText: "车次",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.card_travel, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(8) //限制长度
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
                    style: TextStyle(color: Colors.black),
                    controller: _controller_time,
                    decoration: InputDecoration(
                        hintText: "发车时间",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.timer, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(8) //限制长度
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
                    style: TextStyle(color: Colors.black),
                    controller: _controller_date,
                    decoration: InputDecoration(
                        hintText: "出发日期",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(8) //限制长度
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
                    style: TextStyle(color: Colors.black),
                    controller: _controller_phone,
                    decoration: InputDecoration(
                        hintText: "联系方式",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today, color: Colors.black)),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11) //限制长度
                    ],
                  )),
              RaisedButton(
                  onPressed: () {
                    print(_controller_source.text.toString()=="");
                    if(_controller_source.text.toString() !=""&& _controller_time.text.toString() != "" &&_controller_phone.text.length ==11 &&_controller_destination.text.toString()!=""&& _controller_date.text.toString()!="" ){
                      createTravel();
                    }else{
                      Toast.show("请检查信息是否填写正确", context);
                    }
                    
                  },
                  child: Text("创建")),
            ],
          )),
    );
  }

  Future<void> createTravel() async {
    Dio dio = new Dio();
    if (Global.account != "fangke") {
      try {
        Map<String, String> map = {
          'uid': Global.account,
          'source': _controller_source.text.toString(),
          'destination': _controller_destination.text.toString(),
          'date': _controller_date.text.toString(),
          'time': _controller_source.text.toString(),
          'phone': _controller_phone.text.toString()
        };
        FormData formData = FormData.fromMap(map);
        print(formData);
        Response response =
            await dio.post(Global.creat_chepiao, data: formData);
        if (response.statusCode == 200) {
          if (response.data == 1) {
            Toast.show("创建行程成功", context, duration: 3);
            Navigator.pop(context);
          } else {
            Toast.show("创建行程失败", context, duration: 2);
          }
        }
      } on DioError {
        // 请求错误处理
        Toast.show("网络错误,请检查网络连接", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } else {
      Toast.show("访客身份", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
