import 'dart:io';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class CreateRoomPage extends StatefulWidget {
  CreateRoomPage({Key key}) : super(key: key);

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  //记录选择的照片
  File _image;
  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;

  Future _getImageFromCamera() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      _image = image;
    });
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
          "创建房间",
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
                      'img_url': _imgServerPath,
                      'intro': introController.text.toString(),
                      'public': _switchItemA ? '0' : '1',
                      'password':
                          _switchItemA ? pwdController.text.toString() : ""
                    };
                    FormData formData = FormData.fromMap(map);
                    Response response = await dio.post(
                      Global.create_room,
                      data: formData,
                    );
                    if (response.statusCode == 200) {
                      print(response.toString());
                      if (response.data == 200) {
                        Toast.show("创建房间成功", context);
                        Navigator.pop(context);
                      }
                    }
                  } else {
                    Toast.show("房间名称不能为空", context);
                  }
                },
                child: Icon(Icons.done),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ))
        ],
      ),
      // body: Padding(padding: const EdgeInsets.all(30.0),
      // child:buildTextField(),),
      // body:myGridView.build(context),
      body: ListView(
        padding: EdgeInsets.all(15),
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
          SizedBox(height: 10),
          Text("选择房间封面"),
          Row(children: [
            RaisedButton(
              onPressed: () {
                _getImageFromCamera();
              },
              child: Text("照相机"),
            ),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
              onPressed: () {
                _getImageFromGallery();
              },
              child: Text("相册"),
            ),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
                onPressed: () {
                  _uploadImage();
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("上传")),
          ]),
          SizedBox(height: 10),
          _image == null
              ? Text("")
              : Image.file(
                  _image,
                  fit: BoxFit.fitHeight
                ),
          // _imgServerPath == null ? Gaps.vGap16 : Image.network(_imgServerPath),
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

  //上传图片到服务器
  _uploadImage() async {
    
    String path = _image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);//获取名字
    print(name);
    FormData formData = FormData.fromMap({"file":await MultipartFile.fromFile(_image.path, filename:name)});
    Dio dio = new Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio
        .post("http://upload.image.hbxy.xyz/dongtai/index.php", data: formData);
    print(response);
    if (response.statusCode == 200) {
      print(response.data.toString());
      setState(() {
        _imgServerPath = "http://" + response.data.toString();
        Toast.show("上传成功", context);
      });
    }
  }
}
