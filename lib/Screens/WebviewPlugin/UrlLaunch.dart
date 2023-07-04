import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zee_tv_app/Screens/Home/NewHome.dart';

class UrlLaunch extends StatefulWidget {
  @override
  State<UrlLaunch> createState() => _UrlLaunchState();
}

class _UrlLaunchState extends State<UrlLaunch> {
  Uri? url = Uri.parse('http://videos.capcee.in/?theme=m1');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _launchUrl();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202428),
      body: Container(
        width: size.width,
        height: size.height,
      ),
    );
  }

  _launchUrl() async {
    if (!await Future.delayed(Duration(seconds: 1)).then((value) {
      return launchUrl(url!, mode: LaunchMode.inAppWebView);
    })) {
      throw Exception('Could not launch $url');
    }
  }
}
