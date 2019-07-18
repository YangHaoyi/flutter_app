//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

class ControlMapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ControlMapPageState();
  }
}

//控件交互页面
class _ControlMapPageState extends AbstractPageState<ControlMapPage>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
        color: Color(0xFFFEFEFE),
        child:  new ListView(
          children: <Widget>[
            getPageTitle("控件交互"),
            getTextContent("控件是指浮在地图图面上的一系列用于操作地图的组件，例如缩放按钮、指南针、定位按钮、比例尺等。"),
            getTextContent("MapManager类用于操控这些控件，以定制自己想要的视图效果。"),
            getCodeContent(
                "//定义一个MapManager对象\n"
                "private MapManager mapManager;\n"
                "mapManager = MapManager.getInstance()\n"
                ),
            getTitle("缩放按钮"),
            getTextContent("缩放按钮是提供给 App 端用户控制地图缩放级别的交换按钮，每次点击改变1个级别，具体使用方法如下："),
            getCodeContent(
                "/** 放大地图 */\n"
                "public void zoomIn(){\n"
                "    MapManager.getInstance().zoomIn();\n"
                "}\n"
                "/** 缩小地图 */\n"
                "public void zoomOut(){\n"
                "    MapManager.getInstance().zoomOut();\n"
                "}\n"),
            getTitle("中心点连线"),
            getTextContent("中心点连线是自车位置与地图中心点的连线，开发者可以自行设置显示和隐藏，并可以通过自定义方法设置连线的样式，连线的宽度与连线的颜色。"),
            getCodeContent(
                "/** 初始化地图中心点连接线 */\n"
                "private void initMapCenterLine(){\n"
                "    MapManager.getInstance().setCaretLineVisible(true);\n"
                "    MapManager.getInstance().setCenterMarkLineStrokeStyle(MapManager.StrokeStyle.StrokeStyle_solid);\n"
                "    MapManager.getInstance().setCenterMarkLineWidth(2);\n"
                "    MapManager.getInstance().setCenterMarkLineColor(0xFFA1C9F2);\n"
                "    MapManager.getInstance().setCenterMarkLineEnable(true);\n"
            ),
            getBottom(),
          ],
        ),
      ),
    );
  }

}