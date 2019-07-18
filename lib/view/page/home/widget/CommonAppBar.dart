//网页版
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/io.dart';
//import 'package:flutter_web/material.dart';


//手机版
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {

  Menu menu;
  CommonAppBar({Key key,this.menu}): super(key: key);
  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }
  @override
  State createState() {
    return new CommonAppBarState();
  }
}

enum Menu{
  Products,
  Solution,
  Develop,
  Demo,
  ControlCenter
}

class CommonAppBarState extends State<CommonAppBar> {

  var menuText = ["产品介绍","解决方案","开发支持","示例中心","控制台"];
  var clickMenu = Menu.Develop;


  Widget getItem(Menu menuItem){
    return  new Container(
      padding: new EdgeInsets.fromLTRB(convertMargin(), 0, 0, 0),
      child: new Center(
        child: new FlatButton(
          onPressed: (){
            if(menuItem != widget.menu){
              menuClick(menuItem);
              clickMenu = menuItem;
            }
          },
          child:new Text(
            menuText[menuItem.index],
            style: new TextStyle(
              color: Color(0xFFffffff),
            ),
          ),
        ),
      ),
    );
  }

  void menuClick(Menu menuItem){
    switch(menuItem){
      case Menu.Products:
        Navigator.of(context).pushNamed('/products');
        break;
       case Menu.Develop:
         Navigator.of(context).pushNamed('/');
         break;
       case Menu.Demo:
         Navigator.of(context).pushNamed('/demoCenter');
         break;
       case Menu.Solution:
         Navigator.of(context).pushNamed('/solution');
         break;
       case Menu.ControlCenter:
         Navigator.of(context).pushNamed('/controlCenter');
         break;
      default:
        break;
    }
  }

  double convertMargin(){
    if(StateInstance.deviceType == DeviceType.Web){
      return 100;
    }else {
      return 10;
    }
//    if(Platform.isIOS){
//      return 0;
//    }else if(Platform.isAndroid){
//      return 0;
//    }else{
//      return 100;
//    }
  }


  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      child: new Container(
            color: Color(0xFF1D2128),
        height: 60,
        child: new Row(
          children: <Widget>[
            new Container(
              padding:new EdgeInsets.fromLTRB(convertMargin(), 0, 0, 0),
              child:new Center(
                child:new Text(
                  "NavInfo",
                  style: new TextStyle(
                    fontSize: 20,
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ) ,
            ),
            getItem(Menu.Products),
            getItem(Menu.Solution),
            getItem(Menu.Develop),
            getItem(Menu.Demo),
            new Expanded(
                child:new Container(),
                flex: 1,
            ),
            new Container(
              padding: new EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: new Center(
                child: new FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/controlCenter');
                  },
                  child: new Text(
                    menuText[Menu.ControlCenter.index],
                    style: new TextStyle(
                      color: Color(0xFFffffff),
                    ),
                  ),
                  color: Color(0x00FFFFFF),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}