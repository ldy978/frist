import 'package:flutter/material.dart';

class MyGridView1 {
  GestureDetector getStructuredGridCell(context,name, image) {
    // Wrap the child under GestureDetector to setup a on click action
    return GestureDetector(
      onTap: () {
        print("onTap called." + name);
        if (name == "计算机科学与技术") {
          Navigator.pushNamed(context, '/liaotian');
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

        getStructuredGridCell(context,"计算机科学与技术", "a0.jpg"),
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
