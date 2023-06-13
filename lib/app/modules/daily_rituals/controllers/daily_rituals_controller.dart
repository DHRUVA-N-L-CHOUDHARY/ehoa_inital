import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';

class DailyRitualsController extends GetxController with BaseController {
  List<DataList> dailyRitsList = List.empty(growable: true);
  final empowerCtrl = Get.put(EmpowerController());

  @override
  void onReady() async {
    super.onReady();
    getDailyRits();
    update();
  }

  void getDailyRits() {
    dailyRitsList.add(DataList(
        itemId: "0", itemImageUrl: AppImages.dra, itemName: "Morning Rituals"));
    dailyRitsList.add(DataList(
        itemId: "1", itemImageUrl: AppImages.dra, itemName: "Evening Rituals"));
    dailyRitsList.add(DataList(
        itemId: "3", itemImageUrl: AppImages.dra, itemName: "Period Rituals"));
  }
}
