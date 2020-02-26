import 'package:app01/pages/login.dart';
import 'package:flutter/material.dart';

import 'pages/tabs/Tabs.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Tabs() ,
      //路由配置
      routes: {
        '/login':(BuildContext context) => LoginPage()
      },
    );
  }
  
}

