import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zee_tv_app/Screens/Splash/Splash.dart';

import 'Controllers/ApiControllers/TokenController.dart';
import 'Screens/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent(),
        },
        child: GetMaterialApp(
          title: 'Nimu TV',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Splash(),
        ));
  }
}
