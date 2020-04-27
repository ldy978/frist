import 'package:app01/pages/tabs/res/Browser.dart';
import 'package:app01/pages/tabs/res/customview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'global.dart';

class xiaonei extends StatefulWidget {
  xiaonei({Key key}) : super(key: key);

  @override
  _xiaoneiState createState() => _xiaoneiState();
}

class _xiaoneiState extends State<xiaonei> {
  List formList = [];
  initState() {
    super.initState();
    getHttp().then((val) {
      setState(() {
        formList = val.toList();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid': Global.account};
      print(Global.account);
      FormData formData = FormData.fromMap(map);
      response = await dio.post(Global.xiaonei_url, data: formData);
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildGrid(),
      ],
    )));
  }

  Widget buildGrid() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in formList) {
      tiles.add(new Container(
          margin: new EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return Browser(
                    url: item["url"],
                    title: "动态详情",
                  );
                }));
              },
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    new Icon(
                      Icons.ac_unit,
                      color: Colors.black26,
                      size: 17.0,
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 5.0),
                      child: new Text(
                        '校内动态',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    )
                  ],
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
                Text("喜欢" + item['like']),
                new Margin(indent: 6.0),
                // Image.network(
                //   item['news_img'],
                //   fit: BoxFit.cover,
                // ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: item['img_url'],
                ),
                new Margin(indent: 6.0),
                new Text(
                  item['context'],
                  style: new TextStyle(color: Color(0xFF888888)),
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
              ]))));
    }
    return Column(children: tiles);
  }
}
