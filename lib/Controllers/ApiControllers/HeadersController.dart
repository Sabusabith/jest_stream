import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zee_tv_app/ApiConfigs/ApiConfigs.dart';
import 'package:zee_tv_app/Helper/SharedData.dart';

import '../../Model/HeadersModel.dart';

class HeadersController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHeaders();
  }

  RxBool isLoadiing = false.obs;

  var url = ApiConfigs.baseUrl + ApiEndPoints.headers;
  List<HeadersModel>? data;
  Future<List<HeadersModel>?> getHeaders() async {
    var token = await getSavedObject("token");
    isLoadiing(true);
    try {
      Dio dio = Dio();

      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        data = responseData.map((json) => HeadersModel.fromJson(json)).toList();
        isLoadiing(false);
        print("Headers data : ${data}");

        return data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
