
import 'dart:ffi';
import 'dart:io';

import 'package:app01/pages/tabs/res/Browser.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: Drawer(
          elevation: 15,
          child: ListView(
          //padding: EdgeInsets.zero,
          ///edit start
          //padding: EdgeInsets.all(20),
          ///edit end
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 0, 20),
              child: Text(
                '更多',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.perm_data_setting,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('编辑资料'),
              onTap: (){
                print('https://api.asilu.com/bg/');
                Navigator.pushNamed(context, '/editinfo');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('账号与安全'),
              onTap: (){
                print('点击了账号与安全');
                Navigator.pushNamed(context, '/xifu');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.notification_important,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('通知设置'),
              onTap: (){
                print('点击了通知设置');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.lock,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('隐私'),
              onTap: (){
                print('点击了隐私');
                Navigator.pushNamed(context, '/private');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.clear_all,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('清理缓存'),
              onTap: (){
                _clearCache();
                Toast.show("已清理", context);
                print('清理缓存');
              },
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.thumb_up,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('鼓励一下'),
              onTap: (){
                print('点击了鼓励一下');
                Navigator.pushNamed(context, '/wxpay');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.info,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('关于海滨助手'),
              onTap: (){
                print('点击关于海滨助手');
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.live_help,color: Colors.black,),
                backgroundColor: Colors.white10,
              ),
              title: Text('反馈与建议'),
              onTap: (){
                Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return new Browser(
                      url: "https://www.hbxy.xyz/fankui/",
                      title: "反馈与建议",
                    );
                  }));
              },
            ),
          ],
        ),
        ),
    ); 
  } 

  Future<DynamicLibrary> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });
      print('临时目录大小: ' + value.toString());
      // setState(() {
      //   _cacheSizeStr = _renderSize(value);  // _cacheSizeStr用来存储大小的值
      // });
      print(_renderSize(value));
      return _renderSize(value);
  }
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
         int length = await file.length();
         return double.parse(length.toString());
    }
   if (file is Directory) {
         final List<FileSystemEntity> children = file.listSync();
         double total = 0;
         if (children != null)
              for (final FileSystemEntity child in children)
                total += await _getTotalSizeOfFilesInDir(child);
         return total;
      }
      return 0;
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }
  void _clearCache() async {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      print("缓存清理");
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
            final List<FileSystemEntity> children = file.listSync();
            for (final FileSystemEntity child in children) {
              await delDir(child);
            }
          }
      await file.delete();
  }
}