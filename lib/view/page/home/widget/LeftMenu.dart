//网页版
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/home/widget/ConfigProjectPage.dart';
//import 'package:flutter_app/view/page/home/widget/ControlMapPage.dart';
//import 'package:flutter_app/view/page/home/widget/FAQPage.dart';
//import 'package:flutter_app/view/page/home/widget/OverviewPage.dart';
//import 'package:flutter_app/view/page/home/widget/RouteRadarPage.dart';
//import 'package:flutter_app/view/page/home/widget/ShowMapPage.dart';
//import 'package:flutter_app/view/page/home/widget/StartGuidePage.dart';

//手机版
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/home/widget/ConfigProjectPage.dart';
import 'package:flutter_app/view/page/home/widget/ControlMapPage.dart';
import 'package:flutter_app/view/page/home/widget/FAQPage.dart';
import 'package:flutter_app/view/page/home/widget/OverviewPage.dart';
import 'package:flutter_app/view/page/home/widget/RouteRadarPage.dart';
import 'package:flutter_app/view/page/home/widget/ShowMapPage.dart';
import 'package:flutter_app/view/page/home/widget/StartGuidePage.dart';

class LeftMenu extends StatefulWidget{
  LeftMenu({Key key, this.page, this.callBack}) : super(key: key);
  Widget page;
  final callBack;
  @override
  State<StatefulWidget> createState() {
    return _LeftMenuState();
  }
}

//主菜单枚举
enum Item{
  Overview ,
  StartGuide,
  FAQ,
  DevelopGuide
}

//开发指南子页面枚举
enum DevelopGuideItem{
  ConfigProject,
  ShowMap,
  ControlMap,
  RouteRadar,
}

//页面枚举
enum Page{
  Overview ,
  StartGuide,
  FAQ,
  DevelopGuide,
  ShowMap,
  ControlMap,
  RouteRadar,
}

//菜单组件
class _LeftMenuState extends State<LeftMenu>{

  //不支持hot reload 修改后需要重新打版
  var itemNameList = ["概述", "入门指南", "常见问题","开发指南"];
  var developGuideNameList = ["配置工程", "显示地图", "地图交互","路线雷达"];
  //页面踩点点击标识
  var clickItem = Item.Overview;
  //开发指南点击标识
  var developGuideClickItem = DevelopGuideItem.ConfigProject;

  Widget getItemButton(Item item){
    return new Container(
      height: 40,
      width: double.infinity,
      child: new RaisedButton(
        onPressed: (){
          widget.callBack(getPage(Page.values[item.index]));
          setState(() {
            clickItem = item;
            if(item == Item.DevelopGuide){
              developGuideClickItem = DevelopGuideItem.ConfigProject;
            }
          });
        },
        child: Text(
            itemNameList[item.index],
            style: new TextStyle(
              color: clickItem==item?Color(0xFFFFFFFF):Color(0xFF2d3132),
            ),
        ),
        color: clickItem==item?Theme.of(context).primaryColor:Color(0xFFEEF3F6),
//        color: clickItem==item?Color(0xFF404448):Color(0xFFEEF3F6),
      ),
    );
  }

  Widget getDevelopGuideItem(DevelopGuideItem item){
    return new Container(
      height: 30,
      width: double.infinity,
      child: new RaisedButton(
        onPressed: (){
          widget.callBack(getPage(Page.values[item.index+Item.values.length-1]));
          setState(() {
            developGuideClickItem = item;
          });
        },
        child: Text(
          developGuideNameList[item.index],
          style: new TextStyle(
//            color: developGuideClickItem==item?Color(0xFF42A5F5):Color(0xFF656363)
            color: developGuideClickItem==item?Theme.of(context).primaryColor:Color(0xFF656363)
          ),
        ),
        color:Color(0xFFF7FAFC) ,
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

  Widget getDevelopGuideMenu(){
    //Offstage的布局行为完全取决于其offstage参数，相当于visiable与gone
    //当offstage为true，当前控件不会被绘制在屏幕上，不会响应点击事件，也不会占用空间；
    //当offstage为false，当前控件则跟平常用的控件一样渲染绘制；
    return new Offstage(
      offstage: clickItem == Item.DevelopGuide ? false : true,
      child: Column(
        children: <Widget>[
          getDevelopGuideItem(DevelopGuideItem.ConfigProject),
          getDevelopGuideItem(DevelopGuideItem.ShowMap),
          getDevelopGuideItem(DevelopGuideItem.ControlMap),
          getDevelopGuideItem(DevelopGuideItem.RouteRadar),
        ],
      ),
    );
  }

  //跳转页面
  Widget getPage(Page pageState){
    switch(pageState){
            //概述页面
      case Page.Overview:
        return OverviewPage();
        break;
            //入门指南页面
      case Page.StartGuide:
        return StartGuidePage();
        break;
            //常见问题页面
      case Page.FAQ:
        return FAQPage();
        break;
            //开发指南页面
      case Page.DevelopGuide:
        return ConfigProjectPage();
        break;
            //显示地图页面
      case Page.ShowMap:
        return ShowMapPage();
        break;
            //地图控件页面
      case Page.ControlMap:
        return ControlMapPage();
        break;
      case Page.RouteRadar:
        return RouteRadarPage();
        break;
      default:
        return OverviewPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //获取屏幕的宽度（单位dp）
    final size = MediaQuery.of(context).size;
    final width = size.width;
    StateInstance.width = width;
    return new Container(
      width: width/5,
      color: Color(0xFFF7FAFC),
      child: new ListView(
        children: <Widget>[
          getItemButton(Item.Overview),
          getCutLine(),
          getItemButton(Item.StartGuide),
          getCutLine(),
          getItemButton(Item.DevelopGuide),
          getCutLine(),
          getDevelopGuideMenu(),
          getItemButton(Item.FAQ),
        ],
      ),
    );
  }

}