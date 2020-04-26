import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Colors.white,
        title: Text(title,style: TextStyle(color:Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
                icon: Icon(Icons.more_horiz),
                color: Colors.black,
                onPressed: () {
                  print("打开自带浏览器");
                  launch(url);
                },
              )
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}