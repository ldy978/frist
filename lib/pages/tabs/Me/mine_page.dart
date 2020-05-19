import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_face_token();
  }

Future check_face_token() async {
    
      Dio dio = new Dio();
      Map<String, String> map = {
        'uid': Global.account,
        'nickname': Global.nickname,
        'college_name': Global.xueyuan,
        'major_name': Global.zhuanye,
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
        if (response.data != "fail") {
          //Toast.show("注册成功", context);
          //ssNavigator.pop(context);
          print(response.data["face_token"]);
          Global.face_token = response.data["face_token"];
        }
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.accessibility_new),
            label: Text("人像识别"),
            onPressed: () {
              Navigator.pushNamed(context, '/shibie');
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MColors.gray_9a, width: 2.0),
//                  image: DecorationImage(
//                      image: AssetImage('assets/images/avatar.jpeg'))
              ),
              child: Container(
                margin: EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  child: Image.asset("images/avatar.jpeg"),
                ),
              ),
            ),
            Gaps.vGap10,
              Text(
                Global.nickname!=null?Global.nickname:"",
                style: MTextStyles.textBoldDark16,
              ),
              Text(
                Global.banji!=null?Global.banji:"",
                style: MTextStyles.textBoldDark16,
              ),
              Text(
                Global.xueyuan!=null?Global.xueyuan:"",
                style: MTextStyles.textBoldDark16,
              ),
              Text(
                Global.zhuanye!=null?Global.zhuanye:"",
                style: MTextStyles.textBoldDark16,
              ),

            Gaps.vGap4,
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/peoplemessage');
              },
              child: Text(
                '查看我的主页 >',
                style: MTextStyles.textGray12,
              ),
            ),
            Gaps.vGap16,
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/ic_action_collection.png',
                        height: 16,
                        width: 16,
                      ),
                      Gaps.hGap5,
                      Text(
                        '收藏',
                        style: MTextStyles.textGray14,
                      )
                    ],
                  )),
                  Container(
                    width: 0.5,
                    color: MColors.gray_9a,
                    height: 20,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/ic_action_comment.png',
                        height: 16,
                        width: 16,
                      ),
                      Gaps.hGap5,
                      Text(
                        '评论',
                        style: MTextStyles.textGray14,
                      )
                    ],
                  )),
                ],
              ),
            ),
            //Gaps.vGap16,
            Divider(
              color: MColors.gray_9a,
              thickness: 0.5,
              height: 1.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/travel');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '我的行程',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/foot');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '我的足迹',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '意见反馈',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '关于',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      prefs.remove("account");
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '退出',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
