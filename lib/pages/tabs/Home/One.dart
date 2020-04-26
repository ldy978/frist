import 'package:app01/pages/tabs/Home/Home.dart';
import 'package:app01/pages/tabs/Home/Index.dart';
import 'package:app01/pages/tabs/Home/travel_page.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  OnePage({Key key}) : super(key: key);

  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage>with SingleTickerProviderStateMixin {
  //Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController _tabController;

   @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //生命周期方法插入渲染树时调用，只调用一次

  void initState() {
    super.initState();
    //初始化控制器
    _tabController = TabController(
        length: 3, //Tab页的个数
        vsync: this //动画效果的异步处理，默认格式;
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.green,
      //    title: Text(
      //   "聊天室",
      //   style: MTextStyles.textBoldDark16,
      // ),
          title: Flex( //容器，比例摆放，
            direction: Axis.horizontal,
            children: <Widget>[
              // Expanded(
              //   flex: 1,
              //   child: Row(),
              // ),
              Expanded(//这个是为了 让俩中间的导航不至于太过分散
              flex: 3,
                child: TabBar(
                  //指示器颜色
                  indicatorColor: Colors.red,
                  //指示器的间距
                  indicatorPadding: EdgeInsets.only(left: 40, right: 40),
                  //指示器的大小 label：指示器根据图片的大小决定，tab：指示器铺满
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  //指示器
                  tabs: <Widget>[
                    Text("校外动态"),
                    Text("校内动态"),
                    Text("校园新闻"),
                    // Tab(
                    //   icon: Icon(Icons.music_note),
                    // ),
                    // Tab(
                    //   icon: Icon(Icons.queue_music),
                    // ),
                    
                  ],
                  controller: _tabController,
                ),
              ),
              // Expanded(//这个是为了 让俩中间的导航不至于太过分散
              //   flex: 1,
              //   child: Row(),
              // ),
            ],)
            ),
             body: TabBarView(controller: _tabController, children: <Widget>[
      TravelPage(),
      
      new Text('第二页'),
      IndexPage(),
      //new Text("data"),
      ]),
      );
  }
}