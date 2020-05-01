import 'dart:io';
import 'dart:async';
 
class SocketManage {
  static String host='47.94.168.32';
  static int  port=5555;
  static Socket mSocket;
  static  Stream<List<int>> mStream;
 
  static initSocket() async{
      await Socket.connect(host,port).then((Socket socket)  {
        mSocket = socket;
        print("Init Socket Success:");
        mStream=mSocket.asBroadcastStream();      //多次订阅的流 如果直接用socket.listen只能订阅一次
      }).catchError((e) {
        print("Init Socket fail:");
        print('connectException:$e');
        initSocket();
      });
  }
 
  static void  addParams(List<int> params){
    mSocket.add(params);
  }
 
  static void dispos(){
     mSocket.close();
  }
 
}