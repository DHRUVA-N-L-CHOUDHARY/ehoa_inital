import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditNameController extends GetxController with BaseController {
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    nameController.text = MySharedPref.getName();
    super.onInit();
  }

  Future saveProfile() async {
    if (nameController.text.length < 3) {
      DialogHelper.showErrorDialog("Required", "Please enter a valid name");
      return;
    }

    isLoading(true);
    Map<String, dynamic> data = {
      "name": nameController.text,
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    if (res.isNotEmpty) {
      MySharedPref.setName(nameController.text);
    }
    isLoading(false);
    update();
    Future.delayed(const Duration(milliseconds: 500), () => Get.back(),);
  }
}
