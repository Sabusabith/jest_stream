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
                    Obx(
                      () => InkWell(
                        focusColor: Colors.white,
                        autofocus: true,
                        borderRadius: BorderRadius.circular(15),
                        customBorder:
                            selectedItemController.selectedshow.value == index
                                ? Border.all(color: Colors.white, width: 3)
                                : Border.all(),
                        onTap: () {
                          selectedItemController.selectedshowtoggle(index);
                        },
                        child: Container(
                            width: size.width / 2.2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(
                                    ListviewItems().showList[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ),
                    )
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
                    Obx(
                      () => InkWell(
                        autofocus: true,
                        onTap: () {
                          selectedItemController.toggle3(index);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              border: selectedItemController
                                          .selectedItem3.value ==
                                      index
                                  ? Border.all(color: Colors.white, width: 3)
                                  : Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            width: 100,
                            height: 180,
                            child: Image(
                              image: AssetImage(
                                  ListviewItems().popularList[index]),
                              fit: BoxFit.cover,
                            )),
                      ),
                    )
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
