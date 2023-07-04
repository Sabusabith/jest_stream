import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';
import 'package:zee_tv_app/Screens/BetterPlayer/BetterPlayer.dart';
import 'package:zee_tv_app/Screens/Webview.dart';
import 'package:zee_tv_app/Screens/WebviewPlugin/WebviewPlugin.dart';

import '../WebviewPlugin/UrlLaunch.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedItemController selectedItemController =
        Get.put(SelectedItemController());
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: 350,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => InkWell(
                            autofocus: true,
                            borderRadius: BorderRadius.circular(5),
                            customBorder:
                                selectedItemController.mainPage.value == index
                                    ? Border.all(color: Colors.white, width: 3)
                                    : Border.all(),
                            focusColor: Colors.white,
                            onTap: () async {
                              print("Tapped screen");
                              selectedItemController.showMaintoggle(index);
                              await Get.to(UrlLaunch());
                            },
                            child: Container(
                              // decoration: BoxDecoration(
                              //   border: selectedItemController.mainPage.value ==
                              //           index
                              //       ? Border.all(color: Colors.white, width: 3)
                              //       : Border.all(),
                              //   borderRadius: BorderRadius.circular(5),
                              // ),
                              width: 800,
                              child: Image(
                                image: AssetImage("Assets/Images/card.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Trending",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListviewItems().imageList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => InkWell(
                        focusColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        customBorder:
                            selectedItemController.selectedItem.value == index
                                ? Border.all(color: Colors.white, width: 3)
                                : Border.all(),
                        onTap: () {
                          selectedItemController.toggle(index);
                          Get.to(MyTvScreen(
                              url:
                                  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"));
                        },
                        child: Image(
                          image: AssetImage(ListviewItems().imageList[index]),
                          fit: BoxFit.cover,
                          height: 180,
                          width: 100,
                        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Top 10 in the US",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListviewItems().usList.length,
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
                        customBorder:
                            selectedItemController.selectedItem1.value == index
                                ? Border.all(color: Colors.white, width: 4)
                                : Border.all(),
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          selectedItemController.toggle1(index);
                        },
                        child: Container(
                            width: 150,
                            height: 90,
                            child: Image(
                              image: AssetImage(ListviewItems().usList[index]),
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Now playing movies",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListviewItems().nowList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          selectedItemController.toggle2(index);
                        },
                        customBorder:
                            selectedItemController.selectedItem2.value == index
                                ? Border.all(color: Colors.white, width: 3)
                                : Border.all(),
                        autofocus: true,
                        focusColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          height: 180,
                          width: 100,
                          image: AssetImage(ListviewItems().nowList[index]),
                          fit: BoxFit.cover,
                        ),
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
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
