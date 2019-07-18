
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


class SolutionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SolutionPageState();
  }

}

class SolutionPageState extends State<SolutionPage>{

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
      appBar: new CommonAppBar(menu: Menu.Solution),
      body: new Image.asset(
        convertPath('navi_solution.png'),
        fit: BoxFit.cover,
        // 缩放方式，取值 fill contain cover fitWidth fitHeight none scaleDown
        width: StateInstance.width,
      ),
    ) ;
  }

}