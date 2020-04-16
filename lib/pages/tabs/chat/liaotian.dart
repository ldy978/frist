import 'package:app01/controller/socket_manger.dart';
import 'package:app01/pages/tabs/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LiaoTianPage extends StatefulWidget {
  LiaoTianPage({Key key}) : super(key: key);

  @override
  _LiaoTianPageState createState() => _LiaoTianPageState();
}

class _LiaoTianPageState extends State<LiaoTianPage>
    with TickerProviderStateMixin {
      
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing=false;//根据该字段是否包含要发送的文本来决定是否启用发送按钮，并更改按钮的外观

  // @override
  // void initState() { 
  //   super.initState();
  //   List<int> a=[123211];    //请求参数    
  //   SocketManage.mStream.listen(onReceiver);
  //   SocketManage.addParams(a);
  // }

  void onReceiver(List<int> event) {
    debugPrint('useragreement listen :$event');
  }
  
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing=false;//文本字段被清除
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 300), vsync: this),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  //处理动画控制器以在我们不再需要资源时释放资源是个好习惯
  void dispose(){
    for(ChatMessage message in _messages)
       message.animationController.dispose();
       super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: <Widget>[
              new Flexible(
                  child: new TextField(
                controller: _textController,
                onChanged: (String text){//在用户与该字段交互时通知文本的更改
                  setState(() {
                    _isComposing=text.length>0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: "发送消息"),
              )),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    //如果字段长度大于0 就发送数据
                    onPressed: _isComposing?send(_textController.text):null
                    //在Dart语法中，=>函数声明=> expression是{ return expression; }的缩写。
                    ),
              )
            ])));
            
  }
  send (a){
    sendMesaage(a);
    return _handleSubmitted(_textController.text);
  }
  sendMesaage(a){
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("谈天说地"),
        ),
        body: new Column(children: <Widget>[
          new Flexible(
              child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          )
        ]));
  }
}

const String _name = "hekaiyou";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  //animationController指定动画应该如何运行
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      //SizeTransition提供动画效果
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  )
                ])
          ],
        ),
      ),
    );
  }
}