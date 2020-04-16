import 'package:app01/pages/tabs/Home/travel_page.dart';
import 'package:app01/pages/tabs/Me/mine_page.dart';
import 'package:flutter/material.dart';
import 'FaBu.dart';
// import 'Home/Home.dart';
import 'Me/My.dart';
import 'Message/Xiaoxi.dart';
import 'chat/Chat.dart';

class TabsPage extends StatefulWidget {
  
  TabsPage({Key key}) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState();
  
}

class _TabsPageState extends State<TabsPage> {

  
  int _currentIndex=0;


  List _pageList=[
    // HomePage(),
    TravelPage(),
    XiaoxiPage(),
    FaBuPage(),
    ChatPage(),
    // MyPage(),
    MinePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("校园交友"),
        // ),
        floatingActionButton: Container(
          height:80,
          width:80,
          padding:EdgeInsets.all(8),
          margin:EdgeInsets.only(top: 10),
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            
          ),
          
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              setState(() {
                this._currentIndex=2;
              });
            }, 
            backgroundColor:this._currentIndex==2?Colors.red:Colors.yellow,  //悬浮按钮背景色
            ),  
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(  
          currentIndex: this._currentIndex,  //配置对应的索引值
          onTap: (int index){   //改变状态
            setState(() {
              this._currentIndex=index;
            });
          },
          iconSize: 36.0,  // icon的大小
          fixedColor: Colors.green, //选中的颜色
          type:BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
          //type:BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.message),
              title: Text("消息")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title:Text("发布")
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.contacts),
              title: Text("聊天室")
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.account_circle),
              title: Text("我的")
            ),
          ],

        ),
    );
  }
}