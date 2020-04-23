import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //底部阴影
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(context, '/mine');
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: MColors.text_dark,
        ),
      ),
      title: Text(
        "我的行程",
        style: MTextStyles.textBoldDark16,
      ),
      centerTitle: true,
      ),
      body: Center(
          child: new SizedBox(
        height: 360,
        child: Card(
          color: Colors.blue[300],
          margin: EdgeInsets.only(
            left: 20,
            top: 0,
            right: 20,
            bottom: 0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), //设置圆角
          child: Column(children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, //左右间隔
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSpacing: 25.0, //上下间隔
                  children: <Widget>[
                    Text(
                      "始发站",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic, //斜体
                        fontWeight: FontWeight.bold, //加粗
                        letterSpacing: 2.0,
                      ),
                    ),
                    Icon(Icons.add),
                    Text(
                      "终点站",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic, //斜体
                        fontWeight: FontWeight.bold, //加粗
                        letterSpacing: 2.0,
                      ),
                    )
                  ]),
            ),

             SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/name');
                    },
                    color: Colors.white30),
                Icon(Icons.add),
                RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/name');
                    },
                    color: Colors.white24)
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(onPressed:() {
                      Navigator.pushNamed(context, '/name');
                    },
                    child:Text("匹配"),
                    color: Colors.white54,)
              ],
            )
          ]),
        ),
      )),
    );
  }
}
