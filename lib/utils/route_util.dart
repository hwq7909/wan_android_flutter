import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android_flutter/widgets/webview_screen.dart';

class RouteUtil {
  static void push(BuildContext context, Widget page) async {
    if (context == null || page == null) return;
    await Navigator.push(context, new CupertinoPageRoute<void>(builder: (context) => page));
  }

  static void toWebView(BuildContext context, String title, String url) async {
    if (context == null || url.isEmpty) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title);
    } else {
      await Navigator.of(context)
          .push(new CupertinoPageRoute<void>(builder: (context) {
            return new WebViewScreen(
              title: title,
              url: url,
            );
      }));
    }
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}