import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subtitles extends StatelessWidget {
  const Subtitles({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 400,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: TextStyle(
                color: Colors.grey.shade300, fontSize: 21, letterSpacing: 2),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff1E2023)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtitles",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Expanded(
                    child: Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: true,
                            onChanged: (value) {},
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff1E2023)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Subtitles Language",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                      child: Container(
                          child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "English",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
