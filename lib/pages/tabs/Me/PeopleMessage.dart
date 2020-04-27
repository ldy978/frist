import 'package:flutter/material.dart';

class PeopleMessagePage extends StatefulWidget {
  PeopleMessagePage({Key key}) : super(key: key);

  @override
  _PeopleMessageState createState() => _PeopleMessageState();
}

class _PeopleMessageState extends State<PeopleMessagePage> {
  
  Widget MyList(){
    return Column(children: <Widget>[
      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading: Icon(Icons.feedback),
        title: Text(
          '昵称',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/name');
        },
      ),
      Divider(),

      ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        leading:Icon(Icons.feedback),
        title: Text(
          '个性签名',
          style:TextStyle(color:Colors.black),
        ),
        onTap: (){
          Navigator.pushNamed(context, '/qianming');
        },
      ),
      Divider(),


    ],);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //底部阴影
        elevation: 0.0,
        backgroundColor: Colors.white,
        // leading: InkWell(
        //   splashColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   onTap: () {
        //     Navigator.pushNamed(context, '/mine');
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: MColors.text_dark,
        //   ),
        // ),
        title: Text('个人中心'),
      ),
      body: ListView(
        children:<Widget>[
          MyList(),
        ]
      ),
    );
  }
}