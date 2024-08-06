import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zee_tv_app/Helper/CustomTextField.dart';

class Register extends StatelessWidget {
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
                      "Creat An Account For You",
                      style: GoogleFonts.jura(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "to continue to Jet Stream",
                      style: GoogleFonts.jura(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "UserName", controller: usernamecontroller),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "Email", controller: usernamecontroller),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "Password", controller: passwordcontroller),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextFormfield(
                    hint: "Confirm Password", controller: passwordcontroller),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  focusColor: Color.fromARGB(255, 201, 193, 193),
                  autofocus: true,
                  onTap: () {
                    print("Tapped");
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
                          "Register",
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
            ],
          ),
        ));
  }
}
