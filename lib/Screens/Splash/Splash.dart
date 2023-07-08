import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zee_tv_app/Controllers/ApiControllers/HomeMoviesController.dart';
import 'package:zee_tv_app/Controllers/ApiControllers/TokenController.dart';
import 'package:zee_tv_app/Screens/Home/Home.dart';
import 'package:zee_tv_app/Screens/Home/NewHome.dart';
import 'package:zee_tv_app/Screens/Login/Login.dart';

import '../../Controllers/ApiControllers/HeadersController.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  TokenControllers tokenControllers = Get.put(TokenControllers());
  HeadersController controller = Get.put(HeadersController());
  ListMoviesController listMoviesController = Get.put(ListMoviesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerFn();
  }

  timerFn() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.to(Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202428),
      body: Center(
        child: Container(
            width: 300, child: SvgPicture.asset("Assets/Images/logo.svg")),
      ),
    );
  }
}
