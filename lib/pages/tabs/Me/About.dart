import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/dimens.dart';
import 'package:app01/pages/tabs/res/gaps.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = "v 1.0.0";
  String about = "内容部分数据归原北京交通大学海滨学院所有";
  String aboutContent = "本APP只供学习交流和社交之用，\n请勿用作商业用途！";
  String copyRight = "copyright ©2020 VickSun.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MColors.text_dark,
          ),
        ),
        title: Text(
          '关于',
          style: MTextStyles.textBoldDark20,
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 48.0,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: InkWell(
                    // onTap: () => NavigatorUtils.goWebViewPage(context, "GitHub",
                    //     "https://github.com/ViktSun/flutter_mvp"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'GitHub',
                          style: MTextStyles.textGray14,
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: MColors.dart_light_color,
                ),
                Container(
                  height: 48.0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '意见反馈',
                        style: MTextStyles.textGray14,
                      ),
                      Icon(Icons.chevron_right, color: MColors.text_gray)
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16.0,
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 100.0),
                  Gaps.vGap10,
                  Text(
                    "海滨社交",
                    style: TextStyle(
                        fontSize: Dimens.font_sp18,
                        color: MColors.text_dark,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster'),
                  ),
                  Gaps.vGap12,
                  Text(
                    appVersion,
                    style: MTextStyles.textGray12,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Column(
                children: <Widget>[
                  Text(
                    about,
                    style: MTextStyles.textGray12,
                    textAlign: TextAlign.center,
                  ),
                  Gaps.vGap8,
                  Text(
                    aboutContent,
                    style: MTextStyles.textGray12,
                    textAlign: TextAlign.center,
                  ),
                  Gaps.vGap16,
                  Text(
                    copyRight,
                    textAlign: TextAlign.center,
                    style: MTextStyles.textGray12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getAppVersion();
    super.initState();
  }

  void getAppVersion() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // appVersion = "v ${packageInfo.version}";
    setState(() {});
  }
}
