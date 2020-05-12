import 'dart:async';
import 'dart:convert';

import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/dimens.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

// import 'package:flutter_mvp/routers/fluro_navigator.dart';
// import 'package:flutter_mvp/ui/home/home_router.dart';
// import 'package:flutter_mvp/utils/image_utils.dart';
// import 'package:package_info/package_info.dart';
// import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription _subscription;
  String appVersion = "v 1.0.0";
  var flag;
  var name;
  // startTime() async {
  //   //设置启动图生效时间
  //   var _duration = new Duration(seconds: 1);
  //   return new Timer(_duration, navigationPage);
  // }

  // void navigationPage() {
  //   SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
  //   prefs.getString("account")!=null?Navigator.of(context).pushReplacementNamed('/login'): Navigator.of(context).pushReplacementNamed('/login');
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   startTime();
  // }
  void initState() {
    super.initState();
    init();
    //sharePreferences是异步线程 不会立刻获取到数据 所以3秒后再去获取
    Future.delayed(Duration(seconds: 3), () {
      //学号不为空跳转到主页 否则跳转到登录页面
      print(flag);
      net();
      //register_user();
      (flag != null && flag != "")
          ? Navigator.of(context).pushReplacementNamed('/tab')
          : Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  init() async {
    //获取本地数据看看有没有保存用户的账户信息，因为只有用户成功登录之后
    //学号信息才会存储
    final prefs = await SharedPreferences.getInstance();
    flag = prefs.getString("account");
    name = prefs.getString("name");
    Global.account = flag;
    Global.nickname = name;
  }

  Future<void> net() async {
    final prefs = await SharedPreferences.getInstance();
    //print("获取课表信息");
    Dio dio = new Dio();
    if (Global.account != "fangke") {
      try {
        Map<String, String> map = {
          'name': "kb",
          'account': Global.account,
          'numb': Global.account,
        };
        FormData formData = FormData.fromMap(map);
        Response response = await dio.post(Global.info_url, data: formData);
        if (response.statusCode == 200) {
          //print(response.data.toString());
          //print(json.decode(response.data)["information"]["zy"]);
          Global.zhuanye = json.decode(response.data)["information"]["zy"];
          Global.banji = json.decode(response.data)["information"]["bj"];
          Global.xueyuan = json.decode(response.data)["information"]["xy"];
          prefs.setString('zhuanye',Global.zhuanye );
          prefs.setString('banji', Global.banji);
          prefs.setString('xueyuan', Global.xueyuan);
        }
      } on DioError {
        // 请求错误处理
        Toast.show("网络错误,请检查网络连接", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } else {
      Toast.show("访客身份", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
  Future register_user() async {
    Dio dio = new Dio();
    Map<String, String> map = {
      'uid': Global.account,
      'nickname':Global.nickname,
      'college_name':Global.xueyuan,
      'major_name':Global.xueyuan,
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
      if (response.data == 200) {
        Toast.show("注册成功", context);
        //ssNavigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/web_hi_res_512',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Gaps.vGap10,
                      Text(
                        "Flutter Mvp",
                        style: TextStyle(
                            fontSize: Dimens.font_sp18,
                            color: MColors.text_dark,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster'),
                      ),
                    ],
                  )),
            ),
            const Text(
              "每日精选，让你大开眼界",
              style: TextStyle(
                  fontSize: Dimens.font_sp14,
                  color: MColors.text_dark,
                  fontFamily: "FZLanTingHeiS"),
            ),
            Gaps.vGap10,
            Text(
              appVersion,
              style: MTextStyles.textGray12,
            )
          ],
        ),
      ),
    );
  }

  // void _initSplash() {
  //   _subscription = Observable.just(1).delay(Duration(seconds: 2)).listen((_) {
  //     NavigatorUtils.push(context, HomeRouter.homePage, replace: true);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initSplash();
  //   getAppVersion();
  // }

  @override
  void dispose() {
    super.dispose();
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  // void getAppVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   appVersion = "v ${packageInfo.version}";
  //   setState(() {
  //   });
  // }
}
