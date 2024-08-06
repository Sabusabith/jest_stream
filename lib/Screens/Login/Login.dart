import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zee_tv_app/Screens/Home/NewHome.dart';
import 'package:zee_tv_app/Screens/Register/Register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 174, 175, 177),
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 30, 29, 29))),
                  onPressed: () => Get.back(),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
              ),
              SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 30, 29, 29))),
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyUpEvent) {
            final key = event.logicalKey;
            if (key == LogicalKeyboardKey.select) {
            } else if (key == LogicalKeyboardKey.arrowDown) {
              FocusManager.instance.primaryFocus
                  ?.focusInDirection(TraversalDirection.down);
              // Implement fast forward functionality
            } else if (key == LogicalKeyboardKey.arrowUp) {
              FocusManager.instance.primaryFocus
                  ?.focusInDirection(TraversalDirection.up);
              // Implement rewind functionality
            } else if (key == LogicalKeyboardKey.arrowLeft) {
              FocusManager.instance.primaryFocus
                  ?.focusInDirection(TraversalDirection.up);
              // Implement rewind functionality
            } else if (key == LogicalKeyboardKey.arrowRight) {
              FocusManager.instance.primaryFocus
                  ?.focusInDirection(TraversalDirection.down);
              // Implement rewind functionality
            }
          }
        },
        child: WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Container(
                width: size.width,
                height: size.height,
                color: const Color(0xff2d343c),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Color(0xff1b1f22),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 140, left: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Sign in to your account to continue",
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: SizedBox(
                                width: 400,
                                child: TextFormField(
                                  autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.grey.shade400,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 4),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusColor: Colors.white,
                                      label: Text(
                                        "Email",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: SizedBox(
                                width: 400,
                                child: TextFormField(
                                  autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.grey.shade400,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 4),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusColor: Colors.white,
                                      label: Text(
                                        "Password",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 190,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xff3d434a))),
                                            onPressed: () {
                                              Get.to(NewHome());
                                            },
                                            child: Text("Sign In")),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 110,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xff3d434a))),
                                            onPressed: () {},
                                            child:
                                                Center(child: Text("Sign Up"))),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
