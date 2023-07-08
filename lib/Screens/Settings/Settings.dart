import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
import 'package:zee_tv_app/Screens/Settings/About.dart';
import 'package:zee_tv_app/Screens/Settings/Account.dart';
import 'package:zee_tv_app/Screens/Settings/Help.dart';
import 'package:zee_tv_app/Screens/Settings/Subtitles.dart';

class SettingsPage extends StatelessWidget {
  SelectedItemController selectedItemController =
      Get.put(SelectedItemController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202428),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                autofocus: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      named.length,
                      (index) => Obx(
                            () => InkWell(
                              onFocusChange: (value) {
                                selectedItemController.settingsfn(index);
                              },
                              onTap: () {
                                selectedItemController.settingsfn(index);
                              },
                              autofocus: true,
                              focusColor: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                  icons[index],
                                  color: selectedItemController
                                              .settingsindex.value ==
                                          index
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                title: Text(
                                  named[index],
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: selectedItemController
                                                  .settingsindex.value ==
                                              index
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Obx(
                  () => Column(
                    children: [
                      if (selectedItemController.settingsindex.value == 0)
                        Container(
                          child: Expanded(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Account())),
                        ),
                      if (selectedItemController.settingsindex.value == 1)
                        Container(
                          child: Expanded(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: About())),
                        ),
                      if (selectedItemController.settingsindex.value == 2)
                        Expanded(
                          child: Container(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Subtitles())),
                        ),
                      if (selectedItemController.settingsindex.value == 3)
                        Expanded(
                          child: Container(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Subtitles()),
                          ),
                        ),
                      if (selectedItemController.settingsindex.value == 4)
                        Expanded(
                          child: Container(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Account()),
                          ),
                        ),
                      if (selectedItemController.settingsindex.value == 5)
                        Expanded(
                          child: Container(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: HelpAndSupport()),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<IconData> icons = [
    Icons.person_outline_outlined,
    Icons.info_outline,
    Icons.subtitles_outlined,
    Icons.translate_outlined,
    Icons.search,
    Icons.help_outline_outlined
  ];

  List<String> named = [
    "Accounts",
    "About",
    "Subtitles",
    "Preferred Language",
    "Search history",
    "Help and Support"
  ];
}
