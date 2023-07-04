import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';

import '../../Controllers/SelectedItemController.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedItemController selectedItemController =
        Get.put(SelectedItemController());
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 5 / 3,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25),
        itemCount: 11,
        itemBuilder: (BuildContext ctx, index) {
          return Obx(
            () => InkWell(
              focusColor: Color.fromARGB(255, 206, 206, 206),
              borderRadius: BorderRadius.circular(5),
              customBorder: selectedItemController.selectedcate.value == index
                  ? Border.all(color: Colors.white, width: 10)
                  : Border.all(),
              onTap: () {
                selectedItemController.selectedtoggle(index);
              },
              autofocus: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: ListviewItems().gradientList[index],
                  ),
                  child: Text(
                    ListviewItems().catenameList[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
