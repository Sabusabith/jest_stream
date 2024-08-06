import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SelectedItemController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int selectedtabIndex = 0;

  int selection = 0;
  PageController pageController = PageController(initialPage: 0);

  RawKeyEvent? event;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //homePage
  RxInt selectedItem = 0.obs;
  void toggle(int index) => selectedItem.value = index;

  RxInt mainPage = 0.obs;
  void showMaintoggle(int index) => mainPage.value = index;

  RxInt selectedItem1 = 0.obs;
  void toggle1(int index) => selectedItem1.value = index;

  RxInt selectedItem2 = 0.obs;
  void toggle2(int index) => selectedItem2.value = index;

  RxInt selectedItem3 = 0.obs;
  void toggle3(int index) => selectedItem3.value = index;

  //category
  RxInt selectedcate = 0.obs;
  void selectedtoggle(int index) => selectedcate.value = index;

  //Movies
  RxInt selectedmovie = 0.obs;
  void selectedmovietoggle(int index) => selectedmovie.value = index;
  //Shows
  RxInt selectedshow = 0.obs;
  void selectedshowtoggle(int index) => selectedshow.value = index;
//search
  RxInt searchshow = 0.obs;
  void searchshowtoggle(int index) => searchshow.value = index;
//tabfn
  RxInt tabindex = 0.obs;
  void tabfn(int index) {
    tabindex.value = index;
    selectedtabIndex = index;
  }

//settings
  RxInt settingsindex = 10.obs;
  void settingsfn(int index) {
    settingsindex.value = index;
    selectedtabIndex = index;
  }
}
