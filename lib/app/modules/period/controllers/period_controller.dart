import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/helper/dialog_helper.dart';

class PeriodController extends GetxController {
  List<int> days = List.empty(growable: true);
  DataList? selected = DataList(
      isSelected: RxBool(false), itemName: "7", itemId: "7");
  DataList data = DataList(
      isSelected: RxBool(false), itemName: "I don't know", itemId: "0");

  var isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  final UserOnboardingController userOnboardingController = Get.find();


  Future savePeriod() async {
    if (selected == null) {
      DialogHelper.showErrorDialog("Required", "Please enter periods length");
      return;
    }

    isLoading(true);
    Map<String, dynamic> data = {
      'average_cycle_days': selected?.itemId,
    };
userOnboardingController.updateavgcycledays(data['average_cycle_days']);
    Map<String, dynamic> res = await ApiService().savePeriod(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.LANG);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDaysList();
    update();
  }

  void getDaysList() {
    for (var i = 0; i < 14; i++) {
      days.add(i + 1);
    }
  }
}
