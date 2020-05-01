
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
}