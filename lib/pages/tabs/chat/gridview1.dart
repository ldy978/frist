import 'package:app01/pages/tabs/Home/global.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyGridView1 {
  GestureDetector getStructuredGridCell(context,name, image) {
    // Wrap the child under GestureDetector to setup a on click action
    return GestureDetector(
      onTap: () {
        print("onTap called." + name);
        if (name == Global.xueyuan) {//如果院系房间名字是自己的院系则会进入到对应的里面
          Navigator.pushNamed(context, '/liaotian');
        }else{
          Toast.show("不在对应的院系不可加入", context,duration: 2);
        }
      },
      child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Image(image: AssetImage('images/' + image)),
              Center(
                child: Text(name),
              )
            ],
          )),
    );
  }

  GridView build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        //院系名称必须正确
        getStructuredGridCell(context,"计算机与信息技术学院", "a0.jpg"),
        getStructuredGridCell(context,"软件工程", "a1.jpg"),
        getStructuredGridCell(context,"电子商务", "a2.jpg"),
        getStructuredGridCell(context,"金融系", "a3.jpg"),
        getStructuredGridCell(context,"英语系", "a4.jpg"),
        getStructuredGridCell(context,"数学系", "a5.jpg"),
        getStructuredGridCell(context,"化学系", "a6.jpg"),
      ],
    );
  }
}
