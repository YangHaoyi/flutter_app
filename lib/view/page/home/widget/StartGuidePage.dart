//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class StartGuidePage extends StatefulWidget{

  @override
  _StartGuidePageState createState() {
    return _StartGuidePageState();
  }
}

//入门指南页面
class _StartGuidePageState extends AbstractPageState<StartGuidePage>{

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
      color: Color(0xFFFEFEFE),
      child: new ListView(
        children: <Widget>[
          getPageTitle("入门指南"),
          getTitle("第 1 步：下载并安装 Android Studio"),
          getTextContent("按照指南下载并安装 Android Studio。（注：下载地址为Google官方网站)"),
          getTitle("第 2 步：获取图吧Key"),
          getTextContent("在引擎初始化EngineInit的时候传入appName与应用key"),
          getTitle("第 3 步：创建项目"),
          getTextContent("按以下步骤新建一个 Empty Activity 的应用项目。\n"
              "1.启动 Android Studio。如果您看到 Welcome to Android Studio 对话框，请选择 Start a new Android Studio project，否则，请点击 Android Studio 菜单\n"
              "栏中的 File，然后点击 New->New Project，按提示输入您的应用名称、公司域和项目位置。 然后点击 Next。\n"
              "2.选择您的应用所需的机型。 如果您不能确定自己的需要，只需选择 Phone and Tablet。然后点击 Next。\n"
              "3.在“Add an activity to Mobile”对话框中选择 Empty Activity。 然后点击 Next。\n"
              "4.按提示输入 Activity 名称、布局名称和标题。 使用默认值即可。 然后点击 Finish。\n"),
          getBottom(),
        ],
      ),
    );
  }

}