import 'dart:io';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
class shiwuPage extends StatefulWidget {
  shiwuPage({Key key}) : super(key: key);

  @override
  _shiwuPageState createState() => _shiwuPageState();
}

class _shiwuPageState extends State<shiwuPage> {
  String text;
    //记录选择的照片
  File _image;
  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
          '失物招领',
          style: MTextStyles.textBoldDark20,
        ),
      ),
      body: ListView(
        children:<Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() {
                  text = val;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '简述丢失的物品并留下联系方式',
                // helperText: ' 快来分享你的故事',
                // labelText: 'Life story',
              ),
              maxLines: 8,
            ),
          ),
          Row(children: <Widget>[
            Text(
              "    选择照片",
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: Icon(Icons.photo),
              alignment: Alignment.bottomLeft,
              onPressed: () {
               _getImageFromGallery();
              },
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child:
            new RaisedButton(
              child: new Text("发布"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                _uploadImage();
              },
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              disabledElevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //圆角大小
            )
            ),
            SizedBox(width: 10,)
          ]
          ),
          Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: this._image == null
                  ? Center(child:Text("还未选择任何照片"))
                  : Image.file(_image)
          )

        ]
      ),
    );
  }
    //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _uploadImage();
    });
  }
    //上传图片到服务器
  _uploadImage() async {
    String path = _image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length); //获取名字
    print(name);
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(_image.path, filename: name)});
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
        send();
      });
    }
  }
  Future<void> send() async {
    Dio dio = new Dio();
    Map<String, String> map = {
      'uid': Global.account,
      'img_url': _imgServerPath,
      'context': text
    };
    print(map);
    FormData formData = FormData.fromMap(map);
    Response response = await dio.post(
      Global.lost,
      data: formData,
    );
    if (response.statusCode == 200) {
      print(response.toString());
      if (response.data == 200) {
        Toast.show("发布成功", context);
        // Navigator.pop(context);
      }  
    }
  }

}