import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zee_tv_app/Controllers/FavoritesTabController.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';

import '../../Controllers/SelectedItemController.dart';

class FavMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavTabController favTabController = Get.put(FavTabController());
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 260,
            childAspectRatio: 2.5 / 3.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 25),
        itemCount: ListviewItems().favmovieList.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            focusColor: Color.fromARGB(255, 201, 193, 193),
            autofocus: true,
            borderRadius: BorderRadius.circular(5),
            // customBorder: favTabController.selectedfavemov.value == index
            //     ? Border.all(color: Colors.white, width: 3)
            //     : Border.all(),
            onTap: () {
              favTabController.selectedMovie(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      ListviewItems().favmovieList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
