//网页版
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';
import 'package:flutter_app/view/theme/StateInstance.dart';

class ProductsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductsPageState();
  }
}

class ProductsPageState extends State<ProductsPage>{


  String convertPath(String path){
    if(StateInstance.deviceType == DeviceType.Web){
      return path;
    }else{
      return "images/"+path;
    }
  }


  @override
  Widget build(BuildContext context) {
    //获取屏幕的宽度（单位dp）
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return new Scaffold(
        appBar:new CommonAppBar(menu: Menu.Products) ,
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new Column(
                children: <Widget>[
                  new Image.asset(
                    convertPath("navinfo_main.png"),
                    fit: BoxFit.cover,
                    // 缩放方式，取值 fill contain cover fitWidth fitHeight none scaleDown
                    width: width,
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

}