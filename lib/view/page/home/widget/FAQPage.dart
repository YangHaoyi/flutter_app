//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

class FAQPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FAQPageState();
  }
}

//常见问题页面
class _FAQPageState extends AbstractPageState<FAQPage>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
        color: Color(0xFFFEFEFE),
        child:  new ListView(
          children: <Widget>[
            getPageTitle("常见问题"),
            getTitle("地图相关"),
            getEmphasisTitle("还未进入地图界面，发生Crash，是什么原因导致？"),
            getTextContent("对地图的操作需要放到地图初始化完成回调之后进行，地图未初始化完成操作地图，会发生Crash"),
            getEmphasisTitle("进入地图TTS不播报，模拟导航不播报导航信息"),
            getTextContent("图吧导航公版使用的是科大讯飞32语音包进行TTS播报，没有64位版本，如果发生TTS无法播报的情况，首先检查是否使用的是32位版本SDK，64位版本SDK需要客户端\n"
                "自行实现TTS播报功能。确认SDK使用正确后，检查是否进行了TTS初始化操作，并通过Log TAG tts查看是否初始化成功。TTS初始化成功依旧没有TTS播报信息，请检查是否调用了\n"
                "TTSManager.setListener手动监听TTS播报，SDK设置用户手动监听TTS回调后不进行TTS播报。"),
            getBottom(),
          ],
        ),
      ),
    );
  }

}