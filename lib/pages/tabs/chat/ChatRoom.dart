import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({Key key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  List list=["images/5.gif","images/2.gif","images/3.gif","images/4.gif","images/5.gif","images/6.gif"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //一行多少个
        childAspectRatio: 1,
        crossAxisSpacing: 25, //左右间隔
        mainAxisSpacing: 25.0, //上下间隔
        
        ),  //每个Item的长宽比列
        itemCount: 6,
        itemBuilder:(context,index){
          return RaisedButton(
            
            elevation: 5.0,
            padding: EdgeInsets.all(0),
            color: Color.fromARGB(255, 207, 169, 114),
            onPressed: (){
            

          },child:Image.asset(list[index]),
          );
        },
      
       

    ),
    );
  }
}