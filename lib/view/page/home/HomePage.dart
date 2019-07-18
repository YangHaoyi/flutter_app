//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';
//import 'package:flutter_app/view/page/home/widget/LeftMenu.dart';
//import 'package:flutter_app/view/page/home/widget/OverviewPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/home/widget/CommonAppBar.dart';
import 'package:flutter_app/view/page/home/widget/LeftMenu.dart';
import 'package:flutter_app/view/page/home/widget/OverviewPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //页面状态
  Page pageState;
  Widget page = OverviewPage();

  // ignore: slash_for_doc_comments
  /**
   * 与LeftMenu Widget通信回调
   * @param state 页面状态
   * */
  void onPageChanged(state){
    setState(() {
      page = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*屏幕宽度*/
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');
    return Scaffold(
        appBar: new CommonAppBar(menu: Menu.Develop),
        body: new Row(
          children: <Widget>[
            new LeftMenu(page: page,callBack: (value)=>onPageChanged(value)),
            new Expanded(
              child: page,
            )
          ],
        )
    );
  }
}