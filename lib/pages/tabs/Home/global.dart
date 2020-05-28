
class Global {
  static String account;//学号
  static String secret;//密钥
  static String nickname;//姓名
  static String week;//周次
  static String zhuanye;//专业
  static String banji;//班级
  static String xueyuan;//学院
  static String face_token;//面部特征数据
  //信息入库接口
  static String register_info = "http://"+host+":8080/admin.php";
  
  static String host = '192.168.1.9';

  //通知消息接口
  static String notify_url="http://"+host+":8080/admin.php?c=Notify&a=index";
  //失物招领接口
  static String lostandfind="http://"+host+":8080/admin.php?c=Lost&a=index";
  //获取新闻
  static String news_url = "https://xxzx.bjtuhbxy.edu.cn/wxApplets/spaces/home";
  //头像url
  static String avator_img_url =  "https://img2.woyaogexing.com/2019/12/28/ebc0f9f2e4bd498283d51d96f878f391!400x400.jpeg";
  
  //获取校内新闻url
  static String xiaonei_url = "http://"+host+":8080/admin.php?c=News&a=index";
  //创建房间
  static String create_room = "http://"+host+":8080/admin.php?c=Room&a=create";
  
  //获取房间
  static String get_room = "http://"+host+":8080/admin.php?c=Room&a=get";
  
  static bool debug = true;
  //登录接口
  static String info_url = "https://xxzx.bjtuhbxy.edu.cn/login/main/ios/kb";

  //发送动态网址
  static String send_message = "http://"+host+":8080/admin.php?c=News&a=send";
 
  //失物招领发送接口
  static String lost = "http://"+host+":8080/admin.php?c=Lost&a=send";
  
  //人脸识别接口
  static String faceRegister="https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add?access_token=24.5ac35281a37736b36dcfb2f8779cbf6d.2592000.1591376078.282335-19749840";
  
  //人脸匹配接口
  static String pipei="https://aip.baidubce.com/rest/2.0/face/v3/search";
  
  //注册人脸面部特征数据
  static String register_face = "http://"+host+":8080/admin.php?c=Index&a=register_face";
  
  //聊天室接口
  static String yuanximomo = "http://"+host+":8080/admin.php?c=Chat&a=index";
  static String send_yuanxi = "http://"+host+":8080/admin.php?c=Chat&a=send";
  static String current_room_id;
  static String current_room_name;

  //我的行程
  static String chepiao = "http://"+host+":8080/admin.php?c=Travel&a=index";
  static String creat_chepiao = "http://"+host+":8080/admin.php?c=Travel&a=create";
}