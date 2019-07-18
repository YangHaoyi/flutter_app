//网页版
//import 'package:flutter_web/cupertino.dart';
//import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

//手机版
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/page/home/widget/AbstractPage.dart';

class ConfigProjectPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ConfigProjectPage();
  }
}

class _ConfigProjectPage extends AbstractPageState<ConfigProjectPage>{

    @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 0, 30, 0),
      color: Color(0xFFFEFEFE),
      child: new ListView(
        children: <Widget>[
          getPageTitle("Android Studio 配置工程"),
          getTitle("新建一个Android工程"),
          getTextContent("新建一个 Empty Activity 应用项目，您可参考 入门指南<创建工程>章节创建一个 Android 工程。"),
          getTitle("通过拷贝添加SDK"),
          getEmphasisTitle("1、添加 Jar 文件："),
          getTextContent("将下载的地图 SDK 的 jar包复制到工程的 libs 目录下，如果有老版本 jar 包在其中，请删除。"),
          getImage('map_jar.png'),
          getEmphasisTitle("2、添加 So 库："),
          getTextContent("将下载的地图 SDK 的 So库复制到工程的 JniLibs 目录下，根据所要运行的主机版本选取创建指定的So库文件夹（armeabi、armeabi-v7a、arm64-v8a、x86、x86_64等）。"),
          getImage('map_so.png'),
          getBottom(),
        ],
      ),
    );
  }

}