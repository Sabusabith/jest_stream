import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zee_tv_app/Controllers/ApiControllers/OpenVideoController.dart';

import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';
import 'package:zee_tv_app/Screens/BetterPlayer/BetterPlayer.dart';
import 'package:zee_tv_app/Screens/Moviedetails/MovieDetails.dart';
import 'package:zee_tv_app/Screens/Webview.dart';
import 'package:zee_tv_app/Screens/WebviewPlugin/WebviewPlugin.dart';

import '../../Controllers/ApiControllers/HomeMoviesController.dart';
import '../WebviewPlugin/UrlLaunch.dart';

class Home1 extends StatelessWidget {
  ListMoviesController listMoviesController = Get.put(ListMoviesController());
  OpenVideoController openVideoController = Get.put(OpenVideoController());

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
                        InkWell(
                          autofocus: true,
                          borderRadius: BorderRadius.circular(5),
                          // customBorder:
                          //     selectedItemController.mainPage.value == index
                          //         ? Border.all(color: Colors.white, width: 3)
                          //         : Border.all(),
                          focusColor: Color.fromARGB(255, 201, 193, 193),
                          onTap: () async {
                            print("Tapped screen");
                            selectedItemController.showMaintoggle(index);
                            await Get.to(UrlLaunch());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
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
          Container(
            width: size.width,
            height: 600,
            child: Obx(
              () => listMoviesController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : ListView.builder(
                      itemCount: listMoviesController.modelss!.blocks!.length,
                      itemBuilder: (context, mainindex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                listMoviesController
                                    .modelss!.blocks![mainindex].name!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
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
                                itemCount: listMoviesController
                                    .modelss!.blocks![mainindex].movies!.length,
                                itemBuilder: (context, newindex) {
                                  return Row(
                                    children: [
                                      // Text(
                                      //   listMoviesController
                                      //       .modelss!.blocks[newindex].id
                                      //       .toString(),
                                      //   style: TextStyle(color: Colors.white),
                                      // ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        focusColor:
                                            Color.fromARGB(255, 201, 193, 193),
                                        borderRadius: BorderRadius.circular(5),
                                        // customBorder:
                                        //     selectedItemController.selectedItem.value == index
                                        //         ? Border.all(color: Colors.white, width: 3)
                                        //         : Border.all(),
                                        onTap: () async {
                                          String movie = listMoviesController
                                              .modelss!
                                              .blocks![mainindex]
                                              .movies![newindex]
                                              .slug
                                              .toString();

                                          print(movie);
                                          print(listMoviesController
                                              .modelss!
                                              .blocks![mainindex]
                                              .movies![newindex]
                                              .category);
                                          // String a = movie;
                                          // List<String> name = [];
                                          // name = a.split(".");
                                          // print(name[1]);

                                          selectedItemController
                                              .toggle(newindex);
                                          await openVideoController
                                              .getMovieList(movie);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child:
                                                //  Image(
                                                //   image: NetworkImage(
                                                //       "http://api.ott.capcee.com" +
                                                //           listMoviesController
                                                //               .modelss!
                                                //               .blocks![mainindex]
                                                //               .movies![newindex]
                                                //               .thumbnail!),
                                                //   fit: BoxFit.cover,
                                                //   height: 180,
                                                //   width: 100,
                                                // ),
                                                CachedNetworkImage(
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                      downloadProgress) {
                                                return Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[600]!,
                                                    highlightColor:
                                                        Colors.grey[100]!,
                                                    child: Container(
                                                        height: 200.0,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        )));
                                              },
                                              //  CircularProgressIndicator(value: downloadProgress.progress),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              imageUrl:
                                                  "http://api.ott.capcee.com" +
                                                      listMoviesController
                                                          .modelss!
                                                          .blocks![mainindex]
                                                          .movies![newindex]
                                                          .thumbnail!,
                                              fit: BoxFit.cover,
                                              height: 180,
                                              width: 100,
                                            )),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 5),
                            //   child: Text(
                            //     "Now playing movies",
                            //     style: TextStyle(color: Colors.white, fontSize: 17),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   width: size.width,
                            //   height: 150,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: ListviewItems().nowList.length,
                            //     itemBuilder: (context, index) {
                            //       return Row(
                            //         children: [
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           InkWell(
                            //             onTap: () {
                            //               selectedItemController.toggle2(index);
                            //             },
                            //             // customBorder:
                            //             //     selectedItemController.selectedItem2.value == index
                            //             //         ? Border.all(color: Colors.white, width: 3)
                            //             //         : Border.all(),
                            //             autofocus: true,
                            //             focusColor: Color.fromARGB(255, 201, 193, 193),
                            //             borderRadius: BorderRadius.circular(5),
                            //             child: Padding(
                            //               padding: const EdgeInsets.all(5.0),
                            //               child: Image(
                            //                 height: 180,
                            //                 width: 100,
                            //                 image: AssetImage(
                            //                     ListviewItems().nowList[index]),
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       );
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
