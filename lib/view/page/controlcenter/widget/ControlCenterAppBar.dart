//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlCenterAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }

  @override
  State createState() {
    return new ControlCenterAppBarState();
  }
}

class ControlCenterAppBarState extends State<ControlCenterAppBar> {
  Widget getItem(String itemText) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: new Center(
        child: new Text(
          itemText,
          style: new TextStyle(
            color: Color(0xFFffffff),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      child: new Container(
        color: Theme.of(context).primaryColor,
        height: 60,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: new Center(
                child: new Text(
                  "NavInfo",
                  style: new TextStyle(
                    fontSize: 20,
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            getItem("控制台"),
            new Expanded(
              child: new Container(),
              flex: 1,
            ),
            new Container(
              padding: new EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: new Center(
                //FlatButton 与 MaterialButton 类似，不同的是它是透明背景的。
                // 如果一个 Container 想要点击事件时，可以使用 FlatButton 包裹，
                // 而不是 MaterialButton。因为 MaterialButton 默认带背景，而 FlatButton 默认不带背景。
                child: new FlatButton(
                  onPressed: () {
                    //返回上一页面
                    Navigator.pop(context);
                  },
                  child: new Text(
                    "开发文档",
                    style: new TextStyle(
                      color: Color(0xFFffffff),
                    ),
                  ),
                  color: Color(0x00FFFFFF),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
