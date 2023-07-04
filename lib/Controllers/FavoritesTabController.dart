import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  int selectedtabIndex = 0;
  int selection = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = new TabController(
        length: 4, vsync: this, initialIndex: selectedtabIndex);
  }

  //Favtabfn
  RxInt ftabindex = 0.obs;
  void favtabfn(int index) {
    ftabindex.value = index;
    selectedtabIndex = index;
  }

  //favMovies
  RxInt selectedfavemov = 0.obs;
  void selectedMovie(int index) => selectedfavemov.value = index;
}
