import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class NameController extends GetxController {
  
  TextEditingController nameCtrl = TextEditingController();
  final UserOnboardingController userOnboardingController = Get.find();
  bool isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  Future saveName() async {
    if (nameCtrl.text.isEmpty) {
      DialogHelper.showErrorDialog("Required", "Please enter valid name");
      return;
    }
    isLoading(true);
    Map<String,dynamic>data = {
      'name':nameCtrl.text

    };
    userOnboardingController.updatename(
        data['name'] ?? "",);
    Map<String,dynamic> res = await ApiService().saveName(data);
    if (res.isNotEmpty) {

    }
    update();
    isLoading(false);
    Get.toNamed(AppPages.AGE);
  }

  @override
  void onInit() {
    super.onInit();
    update();
  }
}

