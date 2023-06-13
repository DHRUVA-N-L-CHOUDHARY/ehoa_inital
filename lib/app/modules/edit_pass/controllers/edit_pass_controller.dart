import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditPassController extends GetxController with BaseController {
  RxBool isLoading = false.obs;
  TextEditingController editOldPass = TextEditingController();
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future changePass() async {
    if (editOldPass.text.isEmpty) {
      DialogHelper.showErrorDialog("Required", "Old password is required");
      return;
    }

    if (!validatePassword(newPassCtrl.text)) {
      DialogHelper.showErrorDialog("Required",
          "Password should contain Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Number\nMinimum\n1 Special Character");
      return;
    }

    if (editOldPass.text == confirmPass.text) {
      DialogHelper.showErrorDialog("Required", "New password does not match with confirm password");
      return;
    }

    isLoading(true);
    Map<String, dynamic> data = {
      "currentpassword": editOldPass.text,
      "password": newPassCtrl.text,
    };
    Map<String, dynamic> res = await ApiService().changePass(data);
    isLoading(false);

    if (res.isNotEmpty) {
      update();
      Future.delayed(const Duration(milliseconds: 500), () => Get.back(),);
     }

  }
}
