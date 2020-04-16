
import "package:flutter/material.dart";



  
class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  
  Widget barSearch(){
    return Container(
      // child: FlatButton(onPressed: (){
      //   Navigator.pushNamed(context, '/seach');
      // },
       child: new Row(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.search, size: 25.0,),
                margin: const EdgeInsets.only(right: 26.0),
              ),
              // new Expanded(
              //   child: new Container(
              //     child: new Text("搜索知乎内容"),
              //   )
              // ),
              new Expanded(
                child: new FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/search');
                  },
                  child: new Text("搜索内容"),
                )
              ),
              new Container(
                child: new FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/setting');
                  },
                  child: new Icon(Icons.settings, size: 30.0),
                ),
                width: 40.0,
              ),
            ],
          )
       );
       decoration: BoxDecoration(
         borderRadius:const BorderRadius.all(const Radius.circular(4.0)),
         
       );

  }
  
  Widget MyCard(){
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children:<Widget>[
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(150),
              image:DecorationImage(
                image: NetworkImage(
                  "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg"
              ),
              fit:BoxFit.cover )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //昵称
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left:25.0),
                child: Text(
                        '李东燕',
                        style: TextStyle(
                            // color: Color(0xFF888888),//浅灰
                            color: Colors.black,
                            fontSize: 16),
                      ),
              ),
              //个性签名
                    Container(
                      margin: EdgeInsets.only(left: 25.0, top: 8),
                      child: Text(
                        '我也看到了我应',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFF888888), //浅灰
                          //color:Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    )
            ],
          )
        ]
      ),
      );
    
  }
  

  Widget MyList(){
    return Column(children: <Widget>[
      ListTile(
        leading:Icon(Icons.person),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          '个人中心',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/peoplemessage');
        },
      ),

      //分割线
      Divider(),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.feedback),
        title: Text(
          '我的行程',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/travel');
        },
      ),
      //分割线
      Divider(),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.pets),
        title: Text(
          '我的足迹',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/foot');
        },
      ),

      //分割线
      Divider(),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.turned_in_not),
        title: Text(
          '关于',
          style: TextStyle(
            
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/about');
        },
      ),

      //分割线
      Divider(),
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.remove_circle_outline),
        title: Text(
          '退出登录',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          print('执行退出帐号程序 清除系统帐号 密码缓存');
           Navigator.pushNamed(context, '/login');
        },
      ),

     ]);
  }
  @override
  Widget build(BuildContext context) {
    //MaterialApp风格应用
    return MaterialApp( 
      //theme: GlobalConfig.themeData,
      home: Scaffold(
        appBar:AppBar(
          title: barSearch(),
          backgroundColor: Colors.yellow,
        ),
        body: ListView(
          children: <Widget>[
            MyCard(),
            MyList(),
          ],
        )
      ),

    
     
    );
  }
}