//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/controlcenter/widget/ControlCenterAppBar.dart';
//import 'package:flutter_app/view/page/controlcenter/widget/ControlCenterLeftMenu.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/controlcenter/widget/ControlCenterAppBar.dart';
import 'package:flutter_app/view/page/controlcenter/widget/ControlCenterLeftMenu.dart';

class ControlCenterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ControlCenterPageState();
  }
}

class _ControlCenterPageState extends State<ControlCenterPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ControlCenterAppBar(),
      body:new Container(
        width: 100,
        color: Color(0xFFF7FAFC),
        child: new Row(
          children: <Widget>[
            new ControlCenterLeftMenu(),
          ],
        ),
      ),
    );
  }

}