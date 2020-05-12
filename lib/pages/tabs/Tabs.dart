import 'package:app01/pages/tabs/Home/One.dart';
import 'package:app01/pages/tabs/Home/travel_page.dart';
import 'package:app01/pages/tabs/Me/mine_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'FaBu.dart';
// import 'Home/Home.dart';
import 'Home/global.dart';
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
    OnePage(),
    //HomePage(),
    //TravelPage(),
    XiaoxiPage(),
    FaBuPage(),
    ChatPage(),
    // MyPage(),
    MinePage(),
  ];
  final _bottomNavigationTextColor = Colors.black; // 导航字体颜色
  final _bottomNavigationIconColor = Colors.black; // 导航默认图标颜色
  final _bottomNavigationActiveIconColor = Colors.deepOrange; // 导航选中图标颜色
  @override
  Widget build(BuildContext context) {
    register_user();
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
            backgroundColor: Colors.white,
            icon: new Icon(Icons.home, color:_bottomNavigationIconColor),
            title: new Text("首页",style: TextStyle(color: _bottomNavigationTextColor)),
            ),
            new BottomNavigationBarItem(
            icon: new Icon(Icons.message, color: _bottomNavigationIconColor),
            title: new Text("消息",style: TextStyle(color: _bottomNavigationTextColor)),
          ),
             new BottomNavigationBarItem(
            icon: new Icon(
              Icons.add,color: _bottomNavigationIconColor
            ),
            title: new Text("发布",style: TextStyle(color: _bottomNavigationTextColor)),
          ),
            BottomNavigationBarItem(
              icon:Icon(Icons.contacts,color: _bottomNavigationIconColor),
              title: Text("聊天室",style: TextStyle(color: _bottomNavigationTextColor))
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.account_circle,color: _bottomNavigationIconColor),
              title: Text("我的",style: TextStyle(color: _bottomNavigationTextColor))
            ),
          ],

        ),
    );
  }
  Future register_user() async {
    Dio dio = new Dio();
    Map<String, String> map = {
      'uid': Global.account,
      'nickname':Global.nickname,
      'college_name':Global.xueyuan,
      'major_name':Global.zhuanye,
      'class': Global.banji,
    };
    print(map);
    FormData formData = FormData.fromMap(map);
    Response response = await dio.post(
      Global.register_info,
      data: formData,
    );
    if (response.statusCode == 200) {
      print(response.toString());
      if (response.data !="fail") {
        //Toast.show("注册成功", context);
        //ssNavigator.pop(context);
      }
    }
  }
}