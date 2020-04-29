import 'package:flutter/material.dart';


class ChatMessagePage extends StatefulWidget {
  ChatMessagePage({Key key}) : super(key: key);

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  get textEditingController => null;

  @override

  //创建消息输入框组件
//   Widget textComposerWight(){
//     return IconTheme(
//       data: IconThemeData(color:Colors.blue),
//       child:Container(
//         margin:const EdgeInsets.symmetric(horizontal:8.0),
//         child: Row(children: <Widget>[
//           Flexible(
//             child: TextField(
//             //提示内容：请输入消息
//             decoration:InputDecoration.collapsed(hintText:"请输入消息"),
//             //文本编辑控制器
//             controller: textEditingController,
//             //发送消息
//             //获取焦点
//           ),
//           ),
//           //发送按钮容器
//           Container(
//             margin:const EdgeInsets.symmetric(horizontal:8.0),
//             //发送按钮
//             child:IconButton(icon: Icon(Icons.send),
//             //按下发送消息
//             onPressed: ()=>handleSubmit(textEditingController.text),
//                         ),
//                       )
//                     ],),
//                   ),
//                 );
//               }
//               Widget build(BuildContext context) {
//                 return Column(
//                   children: <Widget>[
//                     //使用Consumer获取WebSocketProvider对象
//                     Consumer<WebSocketProvider>(builder:(BuildContext context,WebSocketProvider websocketProvider,Widget child){
                      
//                     })
//                   ],
                   
//                 );
//               }
            
//               void handleSubmit(text) {
//                 textEditingController.clear();
//                 //
//                 Provider.of<WebSocketProvider>(context).sendMessage('chat_public',text);
//               }
              
// 

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}