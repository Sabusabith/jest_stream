import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:zee_tv_app/Helper/SharedData.dart';
import 'package:zee_tv_app/Model/MovieModelss.dart';
import 'package:zee_tv_app/Model/OpenVideoModel.dart';
import 'package:zee_tv_app/Screens/Moviedetails/MovieDetails.dart';

class OpenVideoController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  OpenVideoModel? openvideo;
  getMovieList(String value) async {
    var url = "http://api.ott.capcee.com/customer/get_movie/$value/";
    var token = await getSavedObject("token");
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      openvideo = OpenVideoModel.fromJson(response.data);
      Get.to(MovieDetails());

      print(openvideo!.movie!.video);
    }
  }
}
