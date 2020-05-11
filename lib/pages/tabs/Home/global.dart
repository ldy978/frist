
class Global {
  static String account;//我的学号
  static String secret; 
  static String nickname;//姓名
  static String week;//周次
  static String host = '192.168.1.9';
  static String notify_url="http://"+host+":8080/admin.php?c=Notify&a=index";
  
  static String news_url = "https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/home";
  static String avator_img_url =  "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg";
  
 
  static String xiaonei_url = "http://"+host+":8080/admin.php?c=News&a=index";
  static String create_room = "http://"+host+":8080/admin.php?c=Room&a=create";
  static String get_room = "http://"+host+":8080/admin.php?c=Room&a=get";
  static bool debug = true;
  static String current_room_id;

  static String current_room_name;
  //发送动态网址
  static String send_message = "http://"+host+":8080/admin.php?c=News&a=send";
 
  //失物招领发送接口
  static String lost = "http://"+host+":8080/admin.php?c=Lost&a=send";
  static String faceRegister="https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add?access_token=24.5ac35281a37736b36dcfb2f8779cbf6d.2592000.1591376078.282335-19749840";
}