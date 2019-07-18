//网页版
//import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';

//手机版
import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoCenterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DemoCenterPageState();
  }
}


class DemoCenterPageState extends State<DemoCenterPage>{


  Widget getCutLine(){
    return new Container(
      height: 2,
      width: double.infinity,
      color: Color(0xFFE7E7E7),
    );
  }

  Widget getNoticeTitle(String title){
    return Container(
      padding: new EdgeInsets.fromLTRB(StateInstance.width/10, 10, 0, 10),
      child: new Text(title,
        style: new TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget getDemoItem(String path,String title,String notice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: StateInstance.width/5+20,
          child: new Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:new Column(
                children: <Widget>[
                  new Container(
                    width: StateInstance.width/5,
                    height: StateInstance.width/10,
                    child:Image.asset(
                      convertPath(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                 new Container(
                   width: StateInstance.width/5,
                   padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                   color: Color(0xFFdfebea),
                   child: new Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                     new Text(
                     title,
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w700,
                     ),),
                   new Text(
                     notice,
                     style: TextStyle(
                       fontSize: 12,
                     )
                   )
                     ],
                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String convertPath(String path){
    if(StateInstance.deviceType == DeviceType.Web){
      return path;
    }else{
      return "images/"+path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new CommonAppBar(menu: Menu.Demo),
      body:new Container(
        color: Color(0xFFFEFEFE),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.fromLTRB(StateInstance.width/10, 10, 0, 10),
              child: new Text("SDK示例",
                style: new TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            getCutLine(),
            getNoticeTitle("地图基础功能"),
            new Container(
              padding: new EdgeInsets.fromLTRB(StateInstance.width/10, 10, StateInstance.width/10, 10),
              child:Row(
                children: <Widget>[
                  getDemoItem("map_center.jpg","地图中心点","改示例用于展示如何获取地图中心点经纬度信息"),
                  getDemoItem("map_tmc.jpg","路况","改示例用于展示如何开启与关闭显示当前道路的路况信息"),
                  getDemoItem("map_overlay.jpg","地图覆盖物","改示例用于展示如何在地图界面上绘制地图marker"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

//Container(
//color: Color(0xFFffffff),
//child: Column(
//children: <Widget>[
//new Text(
//title,
//style: TextStyle(
//fontSize: 14,
//fontWeight: FontWeight.w700,
//),),
//new Text(
//notice,
//style: TextStyle(
//fontSize: 12,
//),
//)
//],
//),
//)