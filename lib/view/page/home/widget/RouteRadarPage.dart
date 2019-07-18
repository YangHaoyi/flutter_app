//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

class RouteRadarPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RouteRadarPageState();
  }
}

//常见问题页面
class RouteRadarPageState extends AbstractPageState<RouteRadarPage>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
        color: Color(0xFFFEFEFE),
        child:  new ListView(
          children: <Widget>[
            getPageTitle("路线雷达"),
            getTitle("功能概述"),
            getTextContent("路线雷达是导航引导过程中，后台持续为用户算路并选择合适的路线显示在引导画面，为用户提供备选路线。"),
            getImage("route_radar.jpg"),
            getTitle("配置样式"),
            getTextContent("使用路线雷达功能需要在assets目录下新增两个Json配置文件，具体位置在assets/navicore/conf/map，通过这两个Json可以实现对路线雷达显示形式，显示字号显示字体\n"
                "的配置，并且可以通过debug开启调试模式与打印调试Log。"),
            getImage("route_radar_json.png"),
            getTextContent("路线雷达的Json文件适配多套设备，字体与颜色需要开发者在route_radar.json中自行适配，如下："),
            getImage("route_radar_json_detail.png"),
            getTitle("初始化"),
            getTextContent("路线雷达的描绘基于地图，所以路线雷达的初始化需要在地图渲染完成之后进行，通过 SystemControl.getInstance().addGeneralListener可以监听地图渲染的状态，GeneralEvent_mapRenderInited即为\n"
                "地图渲染完成的标识符，具体实现代码如下："),
            getCodeContent(
                "SystemControl.getInstance().addGeneralListener(new GeneralEventListener() {\n"
                "    @Override\n"
                "    public void onGeneralEvent(enumGeneralEventType event, Object data) {\n"
                "        switch (event){\n"
                "            case GeneralEvent_mapRenderInited:\n"
                "                initRouteRadar();\n"
                "                break;\n"
                "        }\n"
                "    }\n"
                " });\n"
            ),
            getTextContent("初始化路线雷达需要传递路线雷达的显示区域，参数是一个Rect(0,0,0,0)，为显示区域的left，top，right，bottom，常规情况下right和bottom取屏幕的宽和高。"),
            getCodeContent(
                "/** 初始化路线雷达 **/\n"
                "private void initRouteRadar(){\n"
                "    MapManager.getInstance().setRouteRadarLabelViewport(new Rect(0, 0,\n"
                "           SystemControl.getInstance().getScreenWidth(), SystemControl.getInstance().getScreenHeight()));\n"
                "    MapManager.getInstance().setRouteRadarVisible(true);\n"
                "}\n"
            ),
            getTitle("点击事件"),
            getTextContent("路线雷达支持点击事件，以便开发者查看点击线路的路线信息，点击事件回调如下："),
            getCodeContent(
                "/** 路线雷达点击事件 **/\n"
                " MapManager.getInstance().addMapViewListener(new MapViewEventListener() {\n"
                "    @Override\n"
                "    public void onMapViewEvent(enumMapViewEventType event, Object data) {\n"
                "        switch (event){\n"
                "            case clickRouteRadar:\n"
                "                MapViewClickData routeStar = (MapViewClickData) data;\n"
                "                break;\n"
                "        }\n"
                "    }\n"
                "});\n"
            ),
            getTitle("切换路线"),
            getTextContent("路线雷达支持路线切换功能，开发者可以通过调用switchRouteRadarRoute函数手动将导航路线切换到指定的路线上，参数为切换对应路线编号，调用方法如下："),
            getCodeContent(
                "MapManager.getInstance().switchRouteRadarRoute(0);\n"
                "```\n"
            ),
            getTitle("状态更新"),
            getTextContent("为了方便开发者根据路线雷达切换状态进行页面切换，路线雷达提供了两个状态更新回调，分别为路线雷达更新完成与路线雷达切换完成，由于引擎无法在切换路线雷达后触发\n"
                "路线看板的导航信息，手动切换路线雷达后需要开发者手动刷新导航信息看板。"),
            getCodeContent(
                "NaviManager.getInstance().addNaviSessionEventListener(new NaviSessionEventListener() {\n"
                "    @Override\n"
                "    public void onNaviSessionEvent(NaviSessionEvent event, Object data) {\n"
                "        switch (event){\n"
                "            case NaviSessionEvent_routeRadarUpdated:\n"
                "                Log.w(\"RouteRadar\", \"成功更新路线雷达\");\n"
                "                break;\n"
                "            case NaviSessionEvent_routeRadarSwitched:\n"
                "                Log.w(\"RouteRadar\", \"成功切换路线雷达\");\n"
                "        }\n"
                "    }\n"
                "});\n"
            ),
            getTitle("手动刷新路线雷达"),
            getTextContent("路线类达提供手动刷新机制，开发者可以通过reqRouteRadarUpdate手动刷新路线雷达当前状态，方法如下："),
            getCodeContent(
                "MapManager.getInstance().reqRouteRadarUpdate();\n"
            ),
            getBottom(),
          ],
        ),
      ),
    );
  }

}