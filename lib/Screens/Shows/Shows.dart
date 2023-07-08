import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';

class Shows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedItemController selectedItemController =
        Get.put(SelectedItemController());
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListviewItems().moviesList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      focusColor: Color.fromARGB(255, 201, 193, 193),
                      autofocus: true,
                      borderRadius: BorderRadius.circular(15),
                      // customBorder:
                      //     selectedItemController.selectedshow.value == index
                      //         ? Border.all(color: Colors.white, width: 3)
                      //         : Border.all(),
                      onTap: () {
                        selectedItemController.selectedshowtoggle(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                            width: size.width / 2.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage(
                                  ListviewItems().showList[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Popular films this week",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListviewItems().popularList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      autofocus: true,
                      borderRadius: BorderRadius.circular(5),
                      focusColor: Color.fromARGB(255, 201, 193, 193),
                      onTap: () {
                        selectedItemController.toggle3(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image(
                          image: AssetImage(ListviewItems().popularList[index]),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 180,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
