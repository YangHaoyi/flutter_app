//网页版
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/event/ThemeChangeEvent.dart';

//手机版
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/event/ThemeChangeEvent.dart';

class ControlCenterLeftMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ControlCenterLeftMenuState();
  }
}

//主菜单枚举
enum Item{
  UserCenter,
  ChangeTheme ,
  Message,
  DataChart
}

class ControlCenterLeftMenuState extends State<ControlCenterLeftMenu>{

  var itemNameList = ["个人中心", "更换主题", "消息","数据中心"];
  //页面踩点点击标识
  var clickItem = Item.UserCenter;

  Widget getItemButton(Item item){
    return new Container(
      height: 40,
      width: double.infinity,
      child: new FlatButton(
        onPressed: (){
          setState(() {
            clickItem = item;
          });
          itemClick(item);
        },
        child: Text(
          itemNameList[item.index],
          style: new TextStyle(
            color: clickItem==item?Color(0xFFFFFFFF):Color(0xFF2d3132),
          ),
        ),
        color: clickItem==item?Theme.of(context).primaryColor:Color(0xFFEEF3F6),
      ),
    );
  }

  Widget getCutLine(){
    return new Container(
      height: 2,
      width: double.infinity,
      color: Color(0xFFFEFEFE),
    );
  }

  itemClick(Item item){
    switch(item){
      case Item.UserCenter:
        break;
      case Item.ChangeTheme:
        changeTheme();
        break;
      default:
        break;
    }
  }

  changeTheme() async {
//    SharedPreferences sp = await SharedPreferences.getInstance();
//    eventBus.themeIndex themeIndex = sp.getInt("themeIndex");
    int themeIndex = StateInstance.colorIndex;
    themeIndex == 0?themeIndex = 1:themeIndex = 0;
    StateInstance.colorIndex = themeIndex;
//    sp.setInt("themeIndex", themeIndex);
    eventBus.fire(new ThemeChangeEvent(themeIndex));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 100,
      color: Color(0xFFF7FAFC),
      child: new Column(
        children: <Widget>[
          getCutLine(),
          getItemButton(Item.UserCenter),
          getCutLine(),
          getItemButton(Item.ChangeTheme),
          getCutLine(),
          getItemButton(Item.Message),
          getCutLine(),
          getItemButton(Item.DataChart),
          getCutLine(),
        ],
      ),
    );
  }

}
