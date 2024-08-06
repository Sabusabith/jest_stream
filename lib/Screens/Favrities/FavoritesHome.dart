import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zee_tv_app/Controllers/FavoritesTabController.dart';

import 'package:zee_tv_app/Screens/Categories/Categories.dart';
import 'package:zee_tv_app/Screens/Favrities/FavMovies.dart';

import 'package:zee_tv_app/Screens/Home/Home1.dart';
import 'package:zee_tv_app/Screens/Movies/Movies.dart';
import 'package:zee_tv_app/Screens/Shows/Shows.dart';

class FavMoviesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavTabController favTabController = Get.put(FavTabController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff202428),
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(children: [
              SizedBox(
                height: 7,
              ),
              Row(
                children: List.generate(4, (index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => InkWell(
                          onFocusChange: (value) {
                            favTabController.favtabfn(index);
                          },
                          customBorder:
                              favTabController.ftabindex.value == index
                                  ? Border.all(color: Colors.white)
                                  : Border.all(),
                          autofocus: true,
                          focusColor: Colors.white,
                          onTap: () {
                            favTabController.favtabfn(index);
                          },
                          borderRadius:
                              favTabController.ftabindex.value == index
                                  ? BorderRadius.circular(5)
                                  : BorderRadius.circular(0),
                          child: Container(
                            width: 110,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey.shade700)),
                            child: Center(
                              child: Text(
                                names[index],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: favTabController.ftabindex.value ==
                                            index
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                  ;
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Content based on selected tab index
                        if (favTabController.ftabindex.value == 0)
                          Container(child: Expanded(child: FavMovies())),

                        if (favTabController.ftabindex.value == 1)
                          Container(
                            child: Expanded(child: Categories()),
                          ),
                        if (favTabController.ftabindex.value == 2)
                          Expanded(
                            child: Container(
                              child: FavMovies(),
                            ),
                          ),
                        if (favTabController.ftabindex.value == 3)
                          Expanded(
                            child: Container(
                              child: Shows(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }

  List<String> names = [
    "Movies",
    "TV Shows",
    "Added last week",
    "Available in 4K",
  ];
}
