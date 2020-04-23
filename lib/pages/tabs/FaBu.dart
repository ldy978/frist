import 'dart:io';

import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:image_picker/image_picker.dart';

class FaBuPage extends StatefulWidget {
  FaBuPage({Key key}) : super(key: key);

  @override
  _FaBuState createState() => _FaBuState();
}

class _FaBuState extends State<FaBuPage> {
  List _imageUrls = [
    "http://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618143719&di=eebea7d907cfc50930941c412e69f997&imgtype=0&src=http%3A%2F%2Fdesk-fd.zol-img.com.cn%2Ft_s960x600c5%2Fg5%2FM00%2F02%2F04%2FChMkJlbKx_qIJpXEAAY_enwIYD8AALH7gA2YocABj-S662.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618157711&di=e6258a2ba24014b56d61e716f1b48c2e&imgtype=0&src=http%3A%2F%2Fimg.daimg.com%2Fuploads%2Fallimg%2F191014%2F1-1910141GJ40-L.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618138042&di=c9209d1167e5659619e2afab32b1a25f&imgtype=0&src=http%3A%2F%2Ffile.mumayi.com%2Fforum%2F201401%2F16%2F231735cfp4046206r4i705.jpg"
  ];
  var _imgPath;
  File _imageFile;
  String info = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 160,
            child: Swiper(
              itemCount: _imageUrls.length,
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  _imageUrls[index],
                  fit: BoxFit.fill,
                );
              },
              pagination: SwiperPagination(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("                       快来分享你的故事",
          style: TextStyle(fontSize: 18),
          ),
          
          Gaps.vGap10,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (val) {
                setState(() {
                  info = val;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '最多不要超过200个字哦！',
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
              onPressed: () async => await _pickImageFormGallery(),
            ),
            SizedBox(
              width: 120,
            ),
            new RaisedButton(
              child: new Text("发布"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                print("提交按钮+照片");
                print(info);
              },
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              disabledElevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //圆角大小
            )
            // Text(
            //   "    发布",
            //   style: TextStyle(fontSize: 18),
            // ),
            // IconButton(
            //   icon: Icon(Icons.done),
            //   onPressed: (){
            //     print("提交按钮+照片");
            //     print(info);
            //   })
          ]),
          Container(
              height: 150,
              padding: EdgeInsets.all(1),
              child: this._imageFile == null
                  ? Placeholder()
                  : Image.file(
                      this._imageFile,
                    ))
        ],
      ),
    );
  }

  Future<Null> _pickImageFormGallery() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => this._imageFile = imageFile);
  }
}
