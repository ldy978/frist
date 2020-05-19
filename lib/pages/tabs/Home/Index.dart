import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/Browser.dart';
import 'package:app01/pages/tabs/res/MyDrawer.dart';
import 'package:app01/pages/tabs/res/customview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';


class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List formList = [];//校内新闻
  List formList1 =[];//失物招领
  initState() {
    super.initState();
    getHttp().then((val) {
      setState(() {
        formList = val.toList();
      });
    });
    getHttp1().then((val) {
      setState(() {
        formList1 = val.toList();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get(
          Global.news_url,
          queryParameters: {"news": "news"});
      //print(response.data);
      return response.data["main_url_list"];
    } catch (e) {
      return print(e);
    }
  }
  Future getHttp1() async {
    try {
      Response response;
      Dio dio = new Dio();
       Map<String, String> map = {
                          'uid': Global.account
                        };
                        FormData formData = FormData.fromMap(map);
      response = await dio.post(
          Global.lostandfind,
         data: formData);
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
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
                    url: item["href"],
                    title: "校园新闻",
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
                        '校园新闻',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    )
                  ],
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
                Text(item['title']),
                new Margin(indent: 6.0),
                // Image.network(
                //   item['news_img'],
                //   fit: BoxFit.cover,
                // ),
                 FadeInImage.memoryNetwork(
                   placeholder: kTransparentImage,
                   image: item['news_img'],
                 ),
                new Margin(indent: 6.0),
                new Text(
                  item['content'],
                  style: new TextStyle(color: Color(0xFF888888)),
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
              ]))));
    }
    return Column(children: tiles);
  }
   Widget lostandfind() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in formList1) {
      tiles.add(new Container(
          margin: new EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return Browser(
                    url: item["href"],
                    title: "失物招领",
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
                        '失物招领',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    )
                  ],
                ),
                new Divider(
                  color: Color(0xFF888888),
                ),
                //Text(item['title']),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TodayKb(),
              BigDivider(),
              lostandfind(),
              BigDivider(),
              buildGrid(),
            ],
          ))
    );
  }
}

class TodayKb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("失物招领");
          Navigator.pushNamed(context, '/shiwu');
        },
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      color: Colors.black26,
                      size: 17.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '失物招领',
                        style: new TextStyle(color: Color(0xFF888888)),
                      ),
                    ),
                   FlatButton.icon(
                   //padding: EdgeInsets.all(1.0),
                   icon: Icon(Icons.add), 
                   label: Text("添加"),
                   onPressed: (){
                    // print("发布");
                    Navigator.pushNamed(context, '/shiwu');
                   },)
                  ],
                ),
              ),
              Divider(
                color: Color(0xFF888888),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 2.0),
                child: Text("发布信息，快速找回"+"\uD83D\uDE01"),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 2.0),
                child: Text('互帮互助',
                    style: TextStyle(
                        color: Color(
                          0xFF888888,
                        ),
                        fontSize: 12.0)),
              ),
            ],
          ),
        ));
  }
}