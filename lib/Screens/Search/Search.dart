import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zee_tv_app/Controllers/SelectedItemController.dart';

import '../../Helper/ListviewItems.dart';

class Search extends StatelessWidget {
  SelectedItemController selectedItemController =
      Get.put(SelectedItemController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onFocusChange: (value) {
              print("Chaned");
            },
            autofocus: true,
            child: TextField(
              autofocus: false,
              cursorColor: Colors.grey.shade500,
              cursorHeight: 22,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search for movies, shows and more...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey.shade500)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10),
          //   width: size.width,
          //   height: 150,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: ListviewItems().popularList.length,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Obx(
          //             () => InkWell(
          //               autofocus: true,
          //               focusColor: Colors.white,
          //               borderRadius: BorderRadius.circular(5),
          //               customBorder:
          //                   selectedItemController.searchshow.value == index
          //                       ? Border.all(color: Colors.white, width: 3)
          //                       : Border.all(),
          //               onTap: () {
          //                 selectedItemController.searchshowtoggle(index);
          //               },
          //               child: Container(
          //                   width: 100,
          //                   height: 180,
          //                   child: ClipRRect(
          //                     child: Image(
          //                       image: AssetImage(
          //                           ListviewItems().imageList[index]),
          //                       fit: BoxFit.cover,
          //                     ),
          //                   )),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
