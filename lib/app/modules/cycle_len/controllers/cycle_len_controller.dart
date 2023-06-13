import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/helper/dialog_helper.dart';

class CycleLenController extends GetxController {

  TextEditingController nameCtrl = TextEditingController();
  List<int> days = List.empty(growable: true);
  final UserOnboardingController userOnboardingController = Get.find();


  DataList data = DataList(
      isSelected: RxBool(false), itemName: "I don't know", itemId: "0");
  DataList selected = DataList(
      isSelected: RxBool(false), itemName: "28", itemId: "28");
  RxBool isLoading = false.obs;

  Future saveLength() async {
    if (selected.itemId== "-1") {
      DialogHelper.showErrorDialog("Required", "Please enter cycle length");
      return;
    }

    isLoading(true);
    Map<String,dynamic>data = {
      'average_cycle_length':selected.itemId,
    };
    userOnboardingController.updateavgcyclelen(data['average_cycle_length']);
    Map<String,dynamic> res = await ApiService().saveCycleLength(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.PERIOD);
    }
  }
  var isAnimationCompleted = false;

  @override
  void onInit() {
    super.onInit();
    getDaysList();
    update();
  }

  void getDaysList() {
    for (var i = 0; i < 31; i++) {
      days.add(i + 1);
    }
  }
}
