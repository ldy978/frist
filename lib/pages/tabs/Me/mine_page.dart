import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(),
        actions: <Widget>[
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              // NavigatorUtils.push(context, AboutRouter.aboutPage,
              //     replace: false);
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.0),
              child: Image.asset(
                "images/ic_about.png",
                height: 24.0,
                width: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Gaps.vGap40,
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
              "奋斗的小土豆",
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
            Gaps.vGap16,
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
                      Navigator.pushNamed(context, '/care');
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text(
                        '我的关注',
                        style: MTextStyles.textGray14,
                      ),
                    ),
                  ),
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
