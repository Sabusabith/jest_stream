import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zee_tv_app/Helper/SharedData.dart';
import 'package:zee_tv_app/Model/TokenModel.dart';

import '../../ApiConfigs/ApiConfigs.dart';

class TokenControllers extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getToken();
  }

  TokenModel? tokenModel;
  getToken() async {
    var url = ApiConfigs.baseUrl + ApiEndPoints.token;

    Dio dio = Dio();

    Response response = await dio.get(url);
    if (response.statusCode == 200 && response.data["success"] == true) {
      tokenModel = TokenModel.fromJson(response.data);
      saveObject("token", tokenModel!.adminToken);

      print(tokenModel!.adminToken);
    }
  }
}
