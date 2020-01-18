import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan_android_flutter/common/router_config.dart';
import 'package:wan_android_flutter/model/index_banner_list.dart';
import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';
import 'package:wan_android_flutter/network/ResultData.dart';
import 'package:wan_android_flutter/ui/index.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  runApp(MyApp());

  // Android沉浸式
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
//    await HttpManager.getInstance().get(Address.BASE_URL_RELEASE, DataHelper.getBaseMap());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wan Android",
      debugShowCheckedModeBanner: false,
      routes: Router.generateRoute(),
      navigatorKey: navigatorKey,
      home: new MainScreen(),
    );
  }
}
