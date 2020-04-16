import 'package:flutter/material.dart';

class MyGridView3 {
  GestureDetector getStructuredGridCell(context,name, image) {
    // Wrap the child under GestureDetector to setup a on click action
    return GestureDetector(
      onTap: () {
        print("onTap called." + name);
        if (name == "院系陌陌") {
          Navigator.pushNamed(context, '/yuanxi');
        }
        if (name == "班级陌陌") {
          Navigator.pushNamed(context, '/class');
        }
        if (name == "校园陌陌") {
          Navigator.pushNamed(context, '/chatroom');
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
        getStructuredGridCell(context,"现代考试讨论", "1.jpg"),
        getStructuredGridCell(context,"唱歌", "1.jgif"),
        getStructuredGridCell(context,"摄影", "2.gif"),
        getStructuredGridCell(context,"美食", "3.gif"),
        getStructuredGridCell(context,"旅游", "4.gif"),
        getStructuredGridCell(context,"学习使我快乐", "5.gif"),
        getStructuredGridCell(context,"熬夜使我快乐", "6.gif"),
      ],
    );
  }
}
