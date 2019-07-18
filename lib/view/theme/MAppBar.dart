//网页版
//import 'package:flutter_web/cupertino.dart';

//手机版
import 'package:flutter/cupertino.dart';

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  MAppBar({@required this.child}) : assert(child != null);
  final Widget child;
  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }
  @override
  State createState() {
    return new MAppBarState();
  }
}
class MAppBarState extends State<MAppBar> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      child: widget.child,
    );
  }
}