import 'package:app01/controller/socket_manger.dart';
import 'package:app01/pages/login.dart';
import 'package:app01/pages/splash_page.dart';
import 'package:app01/pages/tabs/ChatMessage.dart';
import 'package:app01/pages/tabs/FaBu.dart';
import 'package:app01/pages/tabs/Home/Index.dart';
import 'package:app01/pages/tabs/Home/shiwu.dart';
import 'package:app01/pages/tabs/Home/travel_page.dart';
import 'package:app01/pages/tabs/Me/About.dart';
import 'package:app01/pages/tabs/Me/Care.dart';
import 'package:app01/pages/tabs/Me/Foot.dart';
import 'package:app01/pages/tabs/Me/Name.dart';
import 'package:app01/pages/tabs/Me/PeopleMessage.dart';
import 'package:app01/pages/tabs/Me/QianMing.dart';
import 'package:app01/pages/tabs/Me/Search.dart';
import 'package:app01/pages/tabs/Me/Setting.dart';
import 'package:app01/pages/tabs/Me/Travel.dart';
import 'package:app01/pages/tabs/Me/mine_page.dart';
import 'package:app01/pages/tabs/chat/ChatRoom.dart';
import 'package:app01/pages/tabs/chat/Class.dart';
import 'package:app01/pages/tabs/chat/CreateRoom.dart';
import 'package:app01/pages/tabs/chat/YuanXi.dart';
import 'package:app01/pages/tabs/chat/liaotian.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/tabs/Tabs.dart';
import 'package:oktoast/oktoast.dart';


 void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  //statusBar设置为透明，去除半透明遮罩
final SystemUiOverlayStyle _style =SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  void initState() {
    SocketManage.initSocket();
  }

  @override
  Widget build(BuildContext context) {
   
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,//去掉debug图标
        title: 'Flutter Mvp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
        //路由配置
        routes: <String, WidgetBuilder>{
          '/tab': (BuildContext context) => TabsPage(),
          '/login': (BuildContext context) => LoginPage(),
          '/chatroom': (BuildContext context) => ChatRoomPage(),
          '/yuanxi': (BuildContext context) => YuanXiPage(),
          '/class': (BuildContext context) => ClassPage(),
          '/about': (BuildContext context) => AboutPage(),
          '/travel': (BuildContext context) => TravelPage1(),
          '/foot': (BuildContext context) => FootPage(),
          '/peoplemessage': (BuildContext context) => PeopleMessagePage(),
          '/search': (BuildContext context) => SearchPage(),
          '/setting': (BuildContext context) => SettingPage(),
          '/chatMessage': (BuildContext context) => ChatMessagePage(),
          '/name': (BuildContext context) => NamePage(),
          '/qianming': (BuildContext context) => QianMingPage(),
          '/liaotian': (BuildContext context) => LiaoTianPage(),
          '/mine': (BuildContext context) => MinePage(),
          '/care': (BuildContext context) => CarePage(),
         '/travel_page': (BuildContext context) => TravelPage(),
         '/index': (BuildContext context) => IndexPage(),
         '/fabu': (BuildContext context) => FaBuPage(),
         '/createroom': (BuildContext context) => CreateRoomPage(),
         '/shiwu': (BuildContext context) => shiwuPage(),
        },
        home: SplashPage(),
      ),
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      // position: ToastPosition.bottom,
      dismissOtherOnShow: true,
    );
  }
}
