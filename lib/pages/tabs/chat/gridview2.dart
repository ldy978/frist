import 'package:flutter/material.dart';

class MyGridView2 {
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
        getStructuredGridCell(context,"计算机科学与技术1班", "1.jpg"),
        getStructuredGridCell(context,"软件工程1班", "2.gif"),
        getStructuredGridCell(context,"电子商务1班", "2.gif"),
        getStructuredGridCell(context,"金融系1班", "3.gif"),
        getStructuredGridCell(context,"英语系1班", "4.gif"),
        getStructuredGridCell(context,"数学系1班", "5.gif"),
        getStructuredGridCell(context,"化学系1班", "6.gif"),
      ],
    );
  }
}
