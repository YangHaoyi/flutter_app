//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

// ignore: slash_for_doc_comments
/**
 * @author : YangHaoYi on  2019/5/24.
 * Email  :  yang.haoyi@qq.com
 * Description :概述页面
 * Change : YangHaoYi on  2019/5/24.
 * Version : V 1.0
 */
class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

//概述页面
class _OverviewPageState extends AbstractPageState<OverviewPage> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
      color: Color(0xFFFEFEFE),
      child: new ListView(
        children: <Widget>[
          getPageTitle("概述"),
          getTitle("图吧地图SDK简介"),
          getTextContent("图吧导航开放平台目前开放了基于6.2地图引擎的Jnavicore_6.2以及基于6.5引擎的Jnavicore_6.5两套地图SDK工具。"
              +"\n图吧地图 Android SDK 是一套地图开发调用接口，开发者可以轻松地在自己的Android应用中加入地图相关的功能，包括：地图显示、与地图交互、在地图上绘制、兴趣点搜索、地理编码、离线地图等功能。"),
          getTitle("功能介绍与体验"),
          getCodeContent(
              "/** 地图View */\n"
              "private MapView mapView; \n"
              "\n"
              "@Override\n"
              "public void updateMapView() {\n"
              "    ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);\n"
              "    mapView.setLayoutParams(params);\n"
              "    rootViewGroup.addView(mapView);\n"
              "}\n"
          ),
          getScreenShotImage('show_map.jpg'),
          getTitle("账号与Key的申请"),
          getTextContent("注册成为图吧开发者需要分三步：\n"
              "第一步，加入图吧；\n"
              "第二步，去控制台创建应用；\n"
              "第三步，获取Key。"),
          getTitle("给开发者的建议"),
          getTextContent("图吧开放平台提供的地图API/SDK，您需要先申请Key，才能使用该服务。"),
          getBottom(),
        ],
      ),
    );

  }
}
