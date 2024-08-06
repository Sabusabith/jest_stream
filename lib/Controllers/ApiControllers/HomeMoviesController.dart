// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zee_tv_app/ApiConfigs/ApiConfigs.dart';

import 'package:zee_tv_app/Helper/SharedData.dart';
import 'package:zee_tv_app/Model/MovieModelss.dart';

class ListMoviesController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovieList();
  }

  RxBool isLoading = false.obs;

  var url = ApiConfigs.baseUrl + ApiEndPoints.homemovielist;
  MoviesModelssModel? modelss;
  getMovieList() async {
    isLoading(true);
    var token = await getSavedObject("token");
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      modelss = MoviesModelssModel.fromJson(response.data);
      isLoading(false);
      // print(modelss!.blocks[0].movies[0].thumbnail);
    }
  }
}
