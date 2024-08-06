import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  WebViewController? controllers;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          autofocus: true,
          onTap: () {},
          child: WebView(
            initialUrl: "http://testproject.capcee.com/tv/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              controllers = controller;
              print(controller.currentUrl().toString());
            },
          ),
        ),
      ),
    ));
  }
}
