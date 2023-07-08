// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFormfield extends StatefulWidget {
  CustomTextFormfield(
      {super.key,
      required this.hint,
      this.validator,
      this.sufix = false,
      required this.controller});
  bool sufix;
  String hint;

  var controller;
  String? Function(String?)? validator;

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(),
        height: 65,
        child: TextFormField(
          obscureText: widget.sufix ? show : false,
          cursorColor: Colors.grey.shade300,
          cursorHeight: 18,
          validator: widget.validator,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: widget.sufix
                ? InkWell(
                    onTap: () {
                      setState(() {});
                      show = !show;
                    },
                    child: show
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          ))
                : Container(
                    width: 1,
                    height: 1,
                  ),
            contentPadding: EdgeInsets.only(top: 5, left: 10),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.only(left: 5),
            //   child: Icon(
            //     widget.icon,
            //     color: Colors.grey.shade500,
            //   ),
            // ),
            hintText: widget.hint,
            hintStyle: TextStyle(
                color: const Color.fromARGB(255, 171, 165, 165), fontSize: 16),
            border: InputBorder.none,

            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade600)),
            focusedErrorBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white)),
            errorBorder: OutlineInputBorder(),
            disabledBorder: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
