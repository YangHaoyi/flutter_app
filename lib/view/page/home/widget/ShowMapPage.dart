//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

class ShowMapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ShowMapPageState();
  }
}

//显示地图页面
class _ShowMapPageState extends AbstractPageState<ShowMapPage>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
        color: Color(0xFFFEFEFE),
        child:  new ListView(
          children: <Widget>[
            getPageTitle("显示地图"),
            getTextContent("使用地图SDK之前，需要在 AndroidManifest.xml 文件中进行相关权限设置，确保地图功能可以正常使用。"),
            getTitle("第一步，配置AndroidManifest.xml"),
            getCodeContent(
                "//地图SDK（包含其搜索功能）需要的基础权限\n"
                "<!--允许程序打开网络套接字-->\n"
                "<uses-permission android:name=\"android.permission.INTERNET\"/>\n"
                "<!--允许程序设置内置sd卡的写权限-->\n"
                "<uses-permission android:name=\"android.permission.WRITE_EXTERNAL_STORAGE\"/>\n"
                "<!--允许程序获取网络状态-->\n"
                "<uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\"/>\n"
                "<!--允许程序访问WiFi网络信息-->\n"
                "<uses-permission android:name=\"android.permission.ACCESS_WIFI_STATE\"/>\n"
                "<!--允许程序读写手机状态和身份-->\n"
                "<uses-permission android:name=\"android.permission.READ_PHONE_STATE\"/>\n"
                "<!--允许程序访问CellID或WiFi热点来获取粗略的位置-->\n"
                "<uses-permission android:name=\"android.permission.ACCESS_COARSE_LOCATION\"/>\n"
                "<uses-permission android:name=\"android.permission.ACCESS_FINE_LOCATION\"/>\n"
                "<!--运行程序使用系统弹窗-->\n"
                "<uses-permission android:name=\"android.permission.SYSTEM_ALERT_WINDOW\"/>\n"
                "<uses-permission android:name=\"android.permission.SYSTEM_OVERLAY_WINDOW\"/>\n"
                ),
            getTitle("设置图吧导航Key"),
            getTextContent("在EngineHelper的EngineInit方法中设置图吧导航的Key"),
            getCodeContent(
                "EngineHelper.EngineInit(context, width, height, 0,11, 应用名,申请的Key)"
            ),
            getTitle("第二步，向工程中添加地图开发包"),
            getTextContent("可参考配置工程中新建工程的步骤，添加Jar包与so库到工程目录下。"),
            getImage('map_jar.png'),
            getTitle("第三步，初始化地图容器"),
            getTextContent("MapView 是 AndroidView 类的一个子类， 用于在 Android View 中放置地图。 "
                "MapView 是地图容器。用 MapView 加载地图的方法与 Android 提供的其他 View 一样，具体的使用步骤如下："),
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
            getBottom(),
          ],
        ),
      ),
    );
  }

}