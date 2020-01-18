import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/ui/home_screen.dart';

class RouterName {
  static const String main = 'main';
  static const String home = 'home';
}

class Router {
  static Map<String, WidgetBuilder> generateRoute() {
    Map<String, WidgetBuilder> routes = {
      RouterName.home: (context) => new HomeScreen(),
    };
    return routes;
  }
}