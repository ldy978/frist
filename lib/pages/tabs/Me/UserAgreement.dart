import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


final TextStyle _lowProfileStyle =TextStyle(
  fontSize:12.0,
  color:Color(0xFF4A4A4A),
);
final TextStyle _highProfileStyle=TextStyle(
  fontSize:12.0,
  color:Color(0xFF00CED2),
);
class UserAgreementPage extends StatefulWidget {
  UserAgreementPage({Key key}) : super(key: key);

  @override
  _UserAgreementPageState createState() => _UserAgreementPageState();
}

class _UserAgreementPageState extends State<UserAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      // 文字跨度（`TextSpan`）组件，不可变的文本范围。
      TextSpan(
        // 文本（`text`）属性，跨度中包含的文本。
        text: '登录即同意',
        // 样式（`style`）属性，应用于文本和子组件的样式。
        style: _lowProfileStyle,
        children: [
          TextSpan(
            // 识别（`recognizer`）属性，一个手势识别器，它将接收触及此文本范围的事件。
            // 手势（`gestures`）库的点击手势识别器（`TapGestureRecognizer`）类，识别点击手势。
            recognizer: TapGestureRecognizer()..onTap = () {
              print('点击了“服务条款”');
            },
            text: '“服务条款”',
            style: _highProfileStyle,
          ),
          TextSpan(
            text: '和',
            style: _lowProfileStyle,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              print('点击了“隐私政策”');
            },
            text: '“隐私政策”',
            style: _highProfileStyle,
          ),
        ],
      ),
    );
  }
}
