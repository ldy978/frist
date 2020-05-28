import 'package:app01/pages/tabs/Home/global.dart';
import 'package:app01/pages/tabs/res/colors.dart';
import 'package:app01/pages/tabs/res/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class TravelPage1 extends StatefulWidget {
  TravelPage1({Key key}) : super(key: key);

  @override
  _TravelPage1State createState() => _TravelPage1State();
}

class _TravelPage1State extends State<TravelPage1> {
List ChepaioDate = [];//存放车票信息
  @override
  void initState() { 
    super.initState();
    getTicketDate().then((val) {//获取车票信息并赋值给ChepiaoDate
      setState(() {
        ChepaioDate = val.toList();
      });
    });
  }
  Future getTicketDate() async {
    try {
      Response response;
      Dio dio = new Dio();
      Map<String, String> map = {'uid': Global.account};
      FormData formData = FormData.fromMap(map);
      response = await dio.post(Global.chepiao, data: formData);
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
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
              Navigator.pop(context);
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
        body: EasyRefresh(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildChepiao()
              ],
            )),
            onRefresh: () async {
             getTicketDate().then((val) {//获取车票信息并赋值给ChepiaoDate
      setState(() {
        ChepaioDate = val.toList();
      });
    });
              
            },
          ));
  }
  Widget buildChepiao(){
    List<Widget> l = [];
    for (var item in ChepaioDate){
      l.add(
        Container(
              decoration: BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage("images/chepiao.jpg")
              )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    children:<Widget>[
                      Expanded(child: Row(),flex: 1,),
                      Text(item["source"],style:TextStyle(fontSize:20),),
                      Expanded(child: Row(),flex: 1,),
                      Text(item["train"],style:TextStyle(fontSize:20),),
                      Expanded(child: Row(),flex: 1,),
                      Text(item["destination"],style:TextStyle(fontSize:20),),
                      Expanded(child: Row(),flex: 1,),
                    ]
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child:Text(item["time"]+"发车",style:TextStyle(fontSize:20),)
                  ),
                  //SizedBox(height: 25,),
                  Row(
                    children:<Widget>[
                      Expanded(
                    child:Text("乘车人："+Global.nickname,style:TextStyle(fontSize:15),textAlign: TextAlign.center),
                    flex: 1,
                  ),
                  Expanded(child:Row(),flex:1)
                    ]
                  ),
                  Row(
                    children:<Widget>[
                      SizedBox(width:50),
                      Text("创建时间："+item["create_time"],style:TextStyle(fontSize:15),textAlign: TextAlign.left,),
                    ]
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              )
            )
      );
    }
    return Column(children: l); 
  }
}
