import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zee_tv_app/Controllers/ApiControllers/HeadersController.dart';
import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
import 'package:zee_tv_app/Screens/Categories/Categories.dart';
import 'package:zee_tv_app/Screens/Favrities/FavMovies.dart';
import 'package:zee_tv_app/Screens/Favrities/FavoritesHome.dart';
import 'package:zee_tv_app/Screens/Home/Home1.dart';
import 'package:zee_tv_app/Screens/Movies/Movies.dart';
import 'package:zee_tv_app/Screens/Search/Search.dart';
import 'package:zee_tv_app/Screens/Settings/Settings.dart';
import 'package:zee_tv_app/Screens/Shows/Shows.dart';

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectedItemController selectedItemController =
        Get.put(SelectedItemController());
   
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202428),
      body: SizedBox(
                width: size.width,
                height: size.height,
                child: NestedScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      expandedHeight: 65,
                      backgroundColor: Color(0xff202428),
                      leading: SizedBox(),
                      leadingWidth: 0,
                      title: Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage("Assets/Images/pic.png"),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            //Tabs
                            Container(
                              width: 500,
                              child: Row(
                                children: List.generate(
                                    4, (index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(
                                        () => InkWell(
                                          onFocusChange: (value) {
                                            selectedItemController.tabfn(index);
                                          },
                                          customBorder: selectedItemController
                                                      .tabindex.value ==
                                                  index
                                              ? Border.all(color: Colors.white)
                                              : Border.all(),
                                          autofocus: true,
                                          focusColor: Colors.white,
                                          onTap: () {
                                            selectedItemController.tabfn(index);
                                          },
                                          borderRadius: selectedItemController
                                                      .tabindex.value ==
                                                  index
                                              ? BorderRadius.circular(5)
                                              : BorderRadius.circular(0),
                                          child: Container(
                                                    width: 80,
                                                    height: 35,
                                                    child: Center(
                                                      child: Text(
                                                      "hello",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: selectedItemController
                                                                        .tabindex
                                                                        .value ==
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
                                }),
                              ),
                            ),
                            Obx(
                              () => Transform(
                                transform: Matrix4.translationValues(-22, 0, 0),
                                child: InkWell(
                                    onFocusChange: (value) {
                                      selectedItemController.tabfn(5);
                                    },
                                    customBorder:
                                        selectedItemController.tabindex.value ==
                                                5
                                            ? Border.all(color: Colors.white)
                                            : Border.all(),
                                    autofocus: true,
                                    focusColor: Colors.white,
                                    onTap: () {
                                      selectedItemController.tabfn(5);
                                    },
                                    borderRadius:
                                        selectedItemController.tabindex.value ==
                                                5
                                            ? BorderRadius.circular(5)
                                            : BorderRadius.circular(0),
                                    child: Container(
                                        width: 80,
                                        height: 35,
                                        child: Center(
                                            child: Icon(
                                          CupertinoIcons.search,
                                          color: selectedItemController
                                                      .tabindex.value ==
                                                  5
                                              ? Colors.black
                                              : Colors.white,
                                        )))),
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Obx(
                              () => InkWell(
                                autofocus: true,
                                focusColor: Colors.white,
                                onTap: () {
                                  selectedItemController.tabfn(6);
                                },
                                onFocusChange: (value) {
                                  selectedItemController.tabfn(6);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image:
                                          AssetImage("Assets/Images/Logo.png"),
                                      color: selectedItemController
                                                  .tabindex.value ==
                                              6
                                          ? Colors.black
                                          : null,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                  body: Obx(
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
                          if (selectedItemController.tabindex.value == 0)
                            Container(
                              child: Expanded(child: Home1()),
                            ),
                          if (selectedItemController.tabindex.value == 1)
                            Container(
                              child: Expanded(child: Categories()),
                            ),
                          if (selectedItemController.tabindex.value == 2)
                            Expanded(
                              child: Container(
                                child: Movies(),
                              ),
                            ),
                          if (selectedItemController.tabindex.value == 3)
                            Expanded(
                              child: Container(
                                child: Shows(),
                              ),
                            ),
                          if (selectedItemController.tabindex.value == 4)
                            Expanded(
                              child: Container(
                                child: FavMoviesHome(),
                              ),
                            ),
                          if (selectedItemController.tabindex.value == 5)
                            Expanded(
                              child: Container(
                                child: Search(),
                              ),
                            ),
                          if (selectedItemController.tabindex.value == 6)
                            Expanded(
                              child: Container(
                                child: SettingsPage(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      
    );
  }

  List<String> names = [
    "Home",
    "Categories",
    "Movies",
    "Shows",
    "Favorites",
  ];
}
