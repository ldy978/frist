import 'package:app01/pages/tabs/chat/ChatRoom.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List list=["images/smile.gif","images/smile.gif"];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:GridView.builder(
       gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,//每行方济各item
         childAspectRatio: 1//每个Item的长宽比例
       ),
       itemCount: 2,//构造几个Item
       itemBuilder: (context,index){
         return RaisedButton(
           elevation: 5.0,//按钮的阴影
           padding: EdgeInsets.all(0),//按钮上的文本距离按钮的边界的距离
           color: Color.fromARGB(255, 207, 169, 114),//设置按钮的颜色
           onPressed: (){
             //长按按钮的事件
             if(index==0){
               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage())
               );
             }
             if(index==1){
               Navigator.pushNamed(context, '/');
             }
             
         },
         child: Image.asset(list[index]),
         );
       },
     ),
     
   );
   }
}