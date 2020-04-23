import 'package:app01/pages/tabs/chat/ChatRoom.dart';
import 'package:app01/pages/tabs/chat/gridview.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final MyGridView myGridView = MyGridView();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       //底部阴影
      elevation: 0.0,
      backgroundColor: Colors.white,
      
      title: Text(
        "聊天室",
        style: MTextStyles.textBoldDark16,
      ),
      centerTitle: true,
     ),
     body:myGridView.build(context),
    //  body:GridView.builder(
    //    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
         
    //      crossAxisCount: 2,//每行方济各item
    //      childAspectRatio: 0.85,//每个Item的长宽比例
    //      crossAxisSpacing: 1, //左右间隔
    //     mainAxisSpacing: 1.0, //上下间隔
    //    ),
    //    itemCount: 3,//构造几个Item
    //    itemBuilder: (context,index){
    //      return RaisedButton(
    //        elevation: 10.0,//按钮的阴影
    //        padding: EdgeInsets.all(0),//按钮上的文本距离按钮的边界的距离
    //        onPressed: (){
    //          //长按按钮的事件
    //          if(index==0){
    //            Navigator.pushNamed(context, '/yuanxi');
    //          }
    //          if(index==1){
    //            Navigator.pushNamed(context, '/class');
    //          } 
    //          if(index==2){
    //            Navigator.pushNamed(context, '/chatroom');
    //          } 
    //      },
    //      child:Column(
    //        children: <Widget>[
    //          Image.asset(list[index]),
    //          Text(list1[index],
    //          style: TextStyle(
    //           //  color:Colors.black,
    //             fontSize:8.0,
    //           //  fontStyle:FontStyle.italic,
    //            fontWeight:FontWeight.bold,
    //             letterSpacing: 4.0//文字间距
    //          ),
    //          )
    //        ], 
    //        ),
    //      );
    //    },
    //  ),
     
   );
   }
}