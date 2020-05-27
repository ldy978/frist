import 'package:app01/pages/tabs/Home/global.dart';
import 'package:flutter/material.dart';

class MyGridView2 {
  GestureDetector getStructuredGridCell(context,name, image) {
    // Wrap the child under GestureDetector to setup a on click action
    return GestureDetector(
      onTap: () {
        print("onTap called." + name);
        Global.current_room_name=name;
          Navigator.pushNamed(context, '/liaotian');
        
      },
      child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Image.network(image),
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
        getStructuredGridCell(context,Global.banji, Global.avator_img_url),
      ],
    );
  }
}
