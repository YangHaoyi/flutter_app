class StateInstance {
  // 单例公开访问点
  factory StateInstance() =>_stateInstance();
  static int colorIndex = 0;
  //网页版
//  static DeviceType deviceType = DeviceType.Web;
  //手机版
  static DeviceType deviceType = DeviceType.Android;
  static double width ;

  // 静态私有成员，没有初始化
  static StateInstance _instance = StateInstance._();

  // 私有构造函数
  StateInstance._() {
    // 具体初始化代码
  }

  // 静态、同步、私有访问点
  static StateInstance _stateInstance() {
    return _instance;
  }
}

enum DeviceType{
  Android,
  IOS,
  Web
}