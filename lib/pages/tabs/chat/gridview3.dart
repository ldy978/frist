import 'package:app01/pages/tabs/Home/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class MyGridView3 {
  ListRoom(BuildContext context,roomList) {
    print(roomList);
    List<Widget> array = [];
    for (var item in roomList) {
      print(item["name"]);
      array.add(
          getStructuredGridCell(context,item["name"], item["img_url"],item["intro"])
      );
    }
    return array;
  }

  GestureDetector getStructuredGridCell(context,String  name, String image,String intro) {
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
              Image.network(
                  image,
                  fit: BoxFit.fill),
              Center(
                child: Text(name),
              ),
              Center(
                child: Text("简介"+intro),
              ),
            ],
          )),
    );
  }

  GridView build(BuildContext context,roomList) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: ListRoom(context,roomList)
    );
  }
}
