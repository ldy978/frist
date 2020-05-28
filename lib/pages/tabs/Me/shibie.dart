import 'dart:convert';
import 'dart:io';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class shibiePage extends StatefulWidget {
  shibiePage({Key key}) : super(key: key);

  @override
  _shibiePageState createState() => _shibiePageState();
}

//记录选择的照片
File _image;
//当图片上传成功后，记录当前上传的图片在服务器中的位置
String _imgServerPath;



class _shibiePageState extends State<shibiePage> {
  var token=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 10,
            backgroundColor: Colors.green,
            title: Text(
              "人脸识别",
            ),
            centerTitle: true),
        body: Center(
            child: Global.face_token!=null&&Global.face_token!=""?Text("FACE_TOKEN:"+Global.face_token):RaisedButton(
          onPressed: () {
            select();
          },
          child: Text("开始识别"),
        )));
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
      faceRegister(_imgServerPath);
    }
  }

  //face register
  faceRegister(String url) async {
    print(url);
    Dio dio = new Dio();
    FormData formData = FormData.fromMap({
      "image": url,
      "image_type": "URL",
      "group_id_list": "1",
      "user_id": Global.account,
      "group_id": "1"
    });
    Response response = await dio.post(Global.faceRegister, data: formData);
    if (response.data["error_msg"] == "face already exist") {
      Toast.show("人脸已经存在", context, duration: 5);
      register_to_db(response.data["result"]["face_token"]);
    }
    ;
    if (response.data["error_msg"] == "pic not has face") {
      Toast.show("未识别到人脸", context, duration: 5);
    }
    if (response.data["error_msg"] == "SUCCESS") {
      token = response.data["result"]["face_token"];
      register_to_db(response.data["result"]["face_token"]);
    }
    //print(json.decode(response.data)["error_msg"].toString());
  }

  //保存面部特征到数据库
  Future register_to_db(String face_token) async {
    Dio dio = new Dio();
    FormData formData =
        FormData.fromMap({"uid": Global.account, "face_token": face_token});
    Response response = await dio.post(Global.register_face, data: formData);
    if (response.data.toString() != 0) {
      Toast.show("识别成功", context, duration: 5);
      setState(() {
        Global.face_token = token;
      });
    }else{
       Toast.show("识别失败", context, duration: 5);
    }
  }
}
