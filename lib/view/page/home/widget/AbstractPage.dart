//网页版
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/io.dart';

//手机版
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/cupertino.dart';


class AbstractPageState<T extends StatefulWidget>  extends State<T>{

  var lastChangeTime = "2019年6月13日 16:12";

  Widget getCutLine(){
    return new Container(
      height: 2,
      width: double.infinity,
      color: Color(0xFFE7E7E7),
    );
  }

  Widget getBottom(){
    return new Container(
      padding: new EdgeInsets.fromLTRB(0, 10, 0, 50),
    );
  }

  Widget getPageTitle(String title){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
        new Container(
          padding: new EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: new Text("最后更新时间："+lastChangeTime,
              style: new TextStyle(
                  fontSize: 12,
                  color: Color(0xFFE7E7E7),
                  fontWeight: FontWeight.w700,
              )
          ),
        ),
      ],
    );
  }

  Widget getTitle(String title){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.fromLTRB(0, 20, 0, 10),
          child:
          new Text(
            title,
            style: new TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        getCutLine(),
      ],
    );
  }

  Widget getEmphasisTitle(String title){
    return new Container(
      padding: new EdgeInsets.fromLTRB(0, 20, 0, 10),
      child:
      new Text(
        title,
        style: new TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget getTextContent(String text){
    return  new Container(
      padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: new Text(text),
    );
  }

  Widget getCodeContent(String code){
//    return  new Container(
////            constraints: new BoxConstraints(
//////              width: 150.0,
//////              height: 150.0,
////              maxWidth:100,
////              maxHeight: 100
////            ),
//      padding: new EdgeInsets.fromLTRB(0, 0, 50, 0),
//      height: height,
//      width: 200,
////      child: new Markdown(
////          data: code
////      ),
//    child: new Text(code),
//    );
    return new Container(
      padding: new EdgeInsets.fromLTRB(30, 10, 50, 10),
      color: Color(0xFFE7E7E7),
      child: new Text(code),
    );
  }

  Widget getImage(String path){
    return new Container(
      padding: new EdgeInsets.fromLTRB(convertImageMargin(), 0, convertImageMargin(), 0),
      width: 200,
      child: new Image.asset(
        convertPath(path),
        fit: BoxFit.cover,
        // 缩放方式，取值 fill contain cover fitWidth fitHeight none scaleDown
        width: 500.0,
      ),
    );
  }

  Widget getScreenShotImage(String path){
    return new Container(
      padding: new EdgeInsets.fromLTRB(convertScreenShotMargin(), 0, convertScreenShotMargin(), 0),
      width: 200,
      child: new Image.asset(
        convertPath(path),
        fit: BoxFit.cover,
        // 缩放方式，取值 fill contain cover fitWidth fitHeight none scaleDown
        width: 500.0,
      ),
    );
  }

  double convertScreenShotMargin(){
    if(StateInstance.deviceType == DeviceType.Web){
      return StateInstance.width/7;
    }else{
      return 60;
    }
  }

  double convertImageMargin(){
    if(StateInstance.deviceType == DeviceType.Web){
      return StateInstance.width/5;
    }else{
      return 60;
    }
  }

  String convertPath(String path){
//    if(Platform.isIOS){
//      return "images/"+path;
//    }else if(Platform.isAndroid){
//      return "images/"+path;
//    }else{
//      return path;
//    }
    if(StateInstance.deviceType == DeviceType.Web){
      return path;
    }else{
      return "images/"+path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}