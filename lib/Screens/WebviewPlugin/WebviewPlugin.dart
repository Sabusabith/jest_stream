import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewPlugin extends StatelessWidget {
  String url = "file:///android_asset/flutter_assets/Assets/maps/index.html";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          width: size.width,
          height: size.height,
          child: WebviewScaffold(
            url: url,
            withZoom: false,
            withLocalStorage: true,
            withLocalUrl: true,
            withJavascript: true,
            appCacheEnabled: true,
          )),
    );
  }
}
