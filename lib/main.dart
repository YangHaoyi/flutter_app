//网页版
//import 'package:flutter_app/view/page/demo/DemoCenterPage.dart';
//import 'package:flutter_app/view/page/solution/SolutionPage.dart';
//import 'package:flutter_app/view/theme/StateInstance.dart';
//import 'package:flutter_web/material.dart';
//import 'package:flutter_web/services.dart';
//import 'package:flutter_app/event/ThemeChangeEvent.dart';
//import 'package:flutter_app/view/page/controlcenter/ControlCenterPage.dart';
//import 'package:flutter_app/view/page/home/HomePage.dart';
//import 'package:flutter_app/view/page/products/ProductsPage.dart';
//import 'package:flutter_app/view/theme/themeList.dart';

//手机版
import 'package:flutter_app/view/page/demo/DemoCenterPage.dart';
import 'package:flutter_app/view/page/solution/SolutionPage.dart';
import 'package:flutter_app/view/theme/StateInstance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/event/ThemeChangeEvent.dart';
import 'package:flutter_app/view/page/controlcenter/ControlCenterPage.dart';
import 'package:flutter_app/view/page/home/HomePage.dart';
import 'package:flutter_app/view/page/products/ProductsPage.dart';
import 'package:flutter_app/view/theme/themeList.dart';

//import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //强制横屏显示
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeRight,
  ]);
  int themeIndex = await getTheme();
  runApp(App(themeIndex));
}

Future<int> getTheme() async {
//SharedPreferences基于Flutter SDK只适用于手机端
//  SharedPreferences sp = await SharedPreferences.getInstance();
//  int themeIndex = sp.getInt("themeIndex");
//  if(themeIndex != null) {
//    return themeIndex;
//  }
  int index = StateInstance.colorIndex;
  return index;
}

class App extends StatefulWidget{
  int themeIndex;
  App(this.themeIndex);
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  Color themeColor;
  @override
  void initState() {
    super.initState();
    themeColor = themeList[widget.themeIndex];
    this.registerThemeEvent();
  }

  //注册主题变化监听
  void registerThemeEvent() {
    eventBus.on<ThemeChangeEvent>().listen((ThemeChangeEvent onData)=> this.changeTheme(onData));
  }

  //更改主题
  void changeTheme(ThemeChangeEvent onData) {
    setState(() {
      themeColor = themeList[onData.themeIndex];
    });
  }

  // 应用的根组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: themeColor,
      ),
      title: "",
      initialRoute: '/',
      //配置路由
      routes: <String,WidgetBuilder>{
        '/': (BuildContext context) =>HomePage(),
        '/controlCenter': (BuildContext context) => new ControlCenterPage(),
        '/products': (BuildContext context) => new ProductsPage(),
        '/demoCenter': (BuildContext context) => new DemoCenterPage(),
        '/solution': (BuildContext context) => new SolutionPage(),
      },
      //配置初始化路由后无需写home
      //home: HomePage(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //移除监听
    eventBus.destroy();
  }

}
//Windows环境变量 FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
//                PUB_HOSTED_URL https://pub.flutter-io.cn
//运行Web应用 默认地址 http://127.0.0.1:8080/#/
//发布版本打包命令： flutter pub global run webdev build
// 如果报错 Unable to create merged directory for build 删除根目录下的build文件即可
//公网地址 https://yanghaoyi.github.io/NaviFlutter/flutter_navi/#/
//调试命令：flutter pub global run webdev serve
//对应couldn't find libflutter.so 异常
//64位打包命令
//flutter build apk --target-platform=android-arm64
//32位打包命令
//flutter build apk --target-platform=android-arm32
