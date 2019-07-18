import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }
  @override
  State createState() {
    return new HomeAppBarState();
  }
}

enum Menu{
  Products,
  Solution,
  Develop,
  Demo
}

class HomeAppBarState extends State<HomeAppBar> {

  var menuText = ["产品介绍","解决方案","开发支持","示例中心"];
  var clickMenu = Menu.Develop;

  Widget getItem(Menu menuItem){
    return  new Container(
      padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new Center(
        child: new FlatButton(
          onPressed: (){
            if(menuItem != clickMenu){
              print("==============true");
              menuClick(menuItem);
              clickMenu = menuItem;
            }else{
              print("==============false");
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
      default:
        break;
    }
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
              padding:new EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                child: new RaisedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/controlCenter');
                  },
                  child: new Text(
                    "控制台",
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