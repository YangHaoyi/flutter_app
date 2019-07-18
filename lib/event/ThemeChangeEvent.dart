
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class ThemeChangeEvent{
  int themeIndex;
  ThemeChangeEvent(this.themeIndex);

}