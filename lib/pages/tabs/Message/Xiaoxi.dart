import 'dart:async';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/chat/Chat.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class XiaoxiPage extends StatefulWidget {
  XiaoxiPage({Key key}) : super(key: key);

  @override
  _XiaoxiPageState createState() => _XiaoxiPageState();
}

class _XiaoxiPageState extends State<XiaoxiPage>
    with AutomaticKeepAliveClientMixin {
     
  @override
  bool get wantKeepAlive => true; // 保持底部切换状态不变

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>(); // 下拉刷新使用key 用于主动操作
  List list = [];
   List formList1 = [];

  Future<Null> _getData() {
    final Completer<Null> completer = new Completer<Null>();
    new Timer(Duration(seconds: 1), () {
      // 模拟加载
      setState(() {
        list.add("新加数据${list.length}");
      });
      // 完成刷新
      completer.complete(null);
    });
    return completer.future;
  }

  @override
  initState() {
    // 状态数据初始化
    super.initState();
     getTicketData().then((val) {
      setState(() {
        formList1 = val.toList();
      });
    });
    list.add('我是系统消息'); // 默认收条添加 活动消息（系统消息）
  }

  Future getTicketData() async {
    try {
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid': Global.account};
      FormData formData = FormData.fromMap(map);
      response = await dio.post(Global.info_url, data: formData);
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  @override
  void dispose() {
    // 销毁
    super.dispose();
  }

  void _onTap(String type) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return new ChatPage();
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //底部阴影
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(
          "消息",
          
        ),
        centerTitle: true,
      ),
      body: new RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _getData, // onRefresh 参数是一个Future<Null>的回调
          child: new ListView.builder(
            padding: EdgeInsets.all(10),
            // 这句是在list里面的内容不足一屏时，list可能会滑不动，加上就一直都可以滑动
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: this.list.length,
            itemBuilder: (_, int index) => _createItem(index),
          )),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: (){
      //       Navigator.pushNamed(context, '/login');
      //     }
      //   ),
      // ),
    );
  }

Widget chepiao() {
    List<Widget> tiles1 = []; //先建一个数组用于存放循环生成的widget
    for (var item in formList1) {
      tiles1.add(
        Container(
        padding: EdgeInsets.only(left: 16, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.deepOrange[300]),
                child: Icon(
                  Icons.add_alert,
                  color: Colors.white,
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.2, color: Colors.black))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "通知",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text("3天前",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700])),
                          ],
                        ),
                        onTap: () {
                          _onTap("");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ))
      );
    }
    return Column(children: tiles1);
  }
 

  Widget _createItem(int index) {
    Widget widget = null;

    if (index % 3 == 1) {
      return chepiao();
    }
    widget = Container(
        padding: EdgeInsets.only(left: 16, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                width: 48,
                height: 48,
                // placeholder: new CircularProgressIndicator(),
                imageUrl: 'https://picsum.photos/64/64?image=${index}',
                // errorWidget: new Icon(Icons.error),
              ),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      _onTap("我是数据");
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.2, color: Colors.black))),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "我是昵称",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "下拉看看效果  ----我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                Text("3天前",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700])),
                              ],
                            ),
                          ),
                          CachedNetworkImage(
                            width: 64,
                            height: 64,
                            // placeholder: new CircularProgressIndicator(),
                            imageUrl:
                                'https://picsum.photos/64/64?image=${index}',
                            // errorWidget: new Icon(Icons.error),
                          )
                        ],
                      ),
                    )))
          ],
        ));

    return widget;
  }
}
