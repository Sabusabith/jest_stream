import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zee_tv_app/Helper/CustomTextField.dart';
import 'package:zee_tv_app/Screens/Home/NewHome.dart';
import 'package:zee_tv_app/Screens/Register/Register.dart';

class Login extends StatelessWidget {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

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
              FocusManager.instance.primaryFocus?.nextFocus();
              // Implement fast forward functionality
            } else if (key == LogicalKeyboardKey.arrowUp) {
              FocusManager.instance.primaryFocus?.nextFocus();
              // Implement rewind functionality
            }
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xff202428),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login With Username and Password",
                      style: GoogleFonts.jura(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Creat Account",
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //       InkWell(
              //         focusColor: Color.fromARGB(255, 201, 193, 193),
              //         autofocus: true,
              //         onTap: () {},
              //         child: Container(
              //             color: Colors.red,
              //             width: 20,
              //             height: 20,
              //             child: TextField()),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "UserName", controller: usernamecontroller),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "Password", controller: passwordcontroller),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  focusColor: Color.fromARGB(255, 201, 193, 193),
                  autofocus: true,
                  onTap: () {
                    print("Tapped");
                    Get.to(NewHome());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      width: size.width,
                      height: 45,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff202428))),
                  )),

              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: 150,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Creat Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          autofocus: true,
                          focusColor: Color.fromARGB(255, 201, 193, 193),
                          onTap: () {
                            Get.to(Register());
                          },
                          child: Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
