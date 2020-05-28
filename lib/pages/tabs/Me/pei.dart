import 'dart:convert';
import 'dart:io';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class peiPage extends StatefulWidget {
  peiPage({Key key}) : super(key: key);

  @override
  _peiPageState createState() => _peiPageState();
}

//记录选择的照片
File _image;
//当图片上传成功后，记录当前上传的图片在服务器中的位置
String _imgServerPath;

class _peiPageState extends State<peiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 10,
            backgroundColor: Colors.green,
            title: Text(
              "拍照找人",
            ),
            centerTitle: true),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 100,),
            Center(
                child: RaisedButton(
              onPressed: () async {
                if (Global.face_token == "" || Global.face_token == null) {
                  bool delete = await showDeleteConfirmDialog1();
                  if (delete == null) {
                    print("取消删除");
                  } else {}
                } else {
                  select();
                }
              },
              child: Text("开始找人"),
            )),
            SizedBox(height:20),
            Text("备注：可信度最高值为100，可信度越大，说明识别结果越准确\n用户需要先在系统中录入了人脸面部信息后才可以使用本功能。",textAlign: TextAlign.center,)
          ],
        ));
  }

  Future select() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      _image = image;
    });
    _uploadImage();
  }

  //上传图片到服务器
  Future _uploadImage() async {
    String path = _image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length); //获取名字
    //print(name);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(_image.path, filename: name)});
    Dio dio = new Dio();
    dio.options.responseType = ResponseType.plain;
    Response response = await dio.post(
        "https://upload.image.hbxy.xyz/dongtai/index.php",
        data: formData);
    //print(response);
    if (response.statusCode == 200) {
      print(response.data.toString());
      setState(() {
        _imgServerPath = "https://" + response.data.toString();
      });
      bijiao(_imgServerPath);
    }
  }

  //face register
  bijiao(String url) async {
    print(url);
    Dio dio = new Dio();
    FormData formData = FormData.fromMap({
      "image": url,
      "image_type": "URL",
      "group_id_list": "1",
      "access_token":
          "24.5ac35281a37736b36dcfb2f8779cbf6d.2592000.1591376078.282335-19749840"
    });
    Response response = await dio.post(Global.pipei, data: formData);
    print(response.data);
    if (response.data["error_msg"] == "SUCCESS") {
      var text = response.data["result"];
      print(text);
      var list = text["user_list"][0];
      print(list);
      var xh = list["user_id"];
      var score = list["score"].toString();
      Toast.show("识别结果：用户学号" + xh + '\n' + "可信度：" + score, context,
          duration: 20);
    } else {
      Toast.show("很抱歉！没有找到该用户的信息", context);
    }
    //print(json.decode(response.data)["error_msg"].toString());
  }

  //保存面部特征到数据库
  Future register_to_db(String face_token) async {
    Dio dio = new Dio();
    FormData formData =
        FormData.fromMap({"uid": Global.account, "face_token": face_token});
    Response response = await dio.post(Global.register_face, data: formData);
    if (response.data.toString() == "success") {
      Toast.show("识别成功", context, duration: 5);
    }
  }

  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示", style: TextStyle(color: Colors.black)),
          content: Text("您还没有将自己的信息入库，立即录入？"),
          actions: <Widget>[
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                "取消",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.white,
              child: Text(
                "好的",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.pushNamed(context, '/shibie');
              },
            ),
          ],
        );
      },
    );
  }
}
