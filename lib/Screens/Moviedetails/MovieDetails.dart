import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zee_tv_app/Controllers/ApiControllers/OpenVideoController.dart';
import 'package:zee_tv_app/Helper/ListviewItems.dart';

import '../../Controllers/SelectedItemController.dart';
import '../BetterPlayer/BetterPlayer.dart';

class MovieDetails extends StatelessWidget {
  SelectedItemController selectedItemController =
      Get.put(SelectedItemController());
  OpenVideoController openVideoController = Get.put(OpenVideoController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202428),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(autofocus: true, onTap: () {}, child: SizedBox()),
              Container(
                height: 480,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(fit: StackFit.expand, children: [
                    ColorFiltered(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      child: Image(
                          image: NetworkImage("http://api.ott.capcee.com" +
                              openVideoController.openvideo!.movie!.thumbnail!),
                          fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          InkWell(
                            autofocus: true,
                            onTap: () {},
                            child: Text(
                              "Vikram Rana",
                              style: GoogleFonts.jura(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 370,
                            child: Container(
                              child: RichText(
                                  text: TextSpan(
                                style: GoogleFonts.jura(
                                    height: 1.3,
                                    color: Colors.white,
                                    fontSize: 13),
                                text:
                                    "A fearless warrior embarks on a thrilling journey to protect his kingdom, discovering his true destiny along the way.",
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 370,
                            child: Container(
                              child: Text(
                                "PG-13  • 2022 (US)  • Action, Superhero • 1h 54m",
                                style: GoogleFonts.jura(
                                    height: 1.3,
                                    color: Colors.white,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            height: 100,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Director",
                                      style: GoogleFonts.jura(
                                          fontSize: 12,
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: 160,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Alexandre Dimitrov",
                                          style: GoogleFonts.jura(
                                              color: Colors.grey.shade100),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Writer",
                                      style: GoogleFonts.jura(
                                          fontSize: 12,
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: 160,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Alexandre Dimitrov",
                                          style: GoogleFonts.jura(
                                              color: Colors.grey.shade100),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Screenplay",
                                      style: GoogleFonts.jura(
                                          fontSize: 12,
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: 160,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Alexandre Dimitrov",
                                          style: GoogleFonts.jura(
                                              color: Colors.grey.shade100),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            autofocus: true,
                            focusColor: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            customBorder: Border.all(color: Colors.orange),
                            onTap: () {
                              Get.to(MyTvScreen(
                                  url: openVideoController.openvideo!.movie!
                                      .video!.videoUrlPlayer!));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_arrow_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Watch Now",
                                        style: GoogleFonts.jura(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Cast & Crew",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  width: size.width,
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ListviewItems().cast.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Obx(
                            () => InkWell(
                                focusColor: Color.fromARGB(255, 168, 162, 162),
                                borderRadius: BorderRadius.circular(5),
                                customBorder: selectedItemController
                                            .selectedItem.value ==
                                        index
                                    ? Border.all(color: Colors.white, width: 3)
                                    : Border.all(),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 0, left: 3, right: 3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: Image(
                                          image: AssetImage(
                                              ListviewItems().cast[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        color: Color.fromARGB(255, 44, 47, 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Rajiv Patel",
                                              style: GoogleFonts.jura(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Vikram Rana",
                                              style: GoogleFonts.jura(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
