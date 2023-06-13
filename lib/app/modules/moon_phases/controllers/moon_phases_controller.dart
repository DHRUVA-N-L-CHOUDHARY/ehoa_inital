import 'package:get/get.dart';

import '../../../data/local/play_list_model.dart';
import '../../../data/remote/api_interface.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class MoonPhasesController extends GetxController with BaseController {
  List<PlayListData> list = List.empty(growable: true);
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    super.onReady();
    fetchMoonPhases();
    update();
  }

  void fetchMoonPhases() async {
    isLoading(true);
    Map<String, dynamic> res = await ApiService().fetchMoonPhases();
    list.clear();
    if (res.isNotEmpty) {
      List<dynamic> moonPhases = res["show_moon_phases"] as List;
      for (int i = 0; i < moonPhases.length; i++) {
        list.add(PlayListData(
            id: moonPhases[i]["moon_phase_id"].toString(),
            imageUrl: ApiInterface.imgPath + moonPhases[i]["icon"].toString(),
            title: moonPhases[i]["moon_phases_name"]
                .toString()
                .split("-")[0]
                .toString(),
            titleCategory: moonPhases[i]["moon_phases_name"]
                .toString()
                .split("-")[1]
                .toString(),
            otherInfo: moonPhases[i]["short_description"].toString()));
      }
    }
    update();
    isLoading(false);
  }
}
