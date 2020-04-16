import 'dart:async';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/tab');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Stack(
        children:<Widget>[
          // 加载页面居中背景图，使用cover模式
          Image.asset("images/loading.jpg",fit:BoxFit.cover),
        ],
      ),
    );
  }
}