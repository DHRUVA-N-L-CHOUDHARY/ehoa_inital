import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class PurposeController extends GetxController {

  TextEditingController nameCtrl = TextEditingController();
  List<DataList> purposes = List.empty(growable: true);
  DataList selected =DataList(isSelected: RxBool(false), itemId: "-1", itemName: Strings.purpose1);
  final UserOnboardingController userOnboardingController = Get.find();

  var isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  Future saveFocus() async {

    if (selected.itemId == "-1") {
      DialogHelper.showErrorDialog("Required", "Please select from any of the option given in the list.");
      return;
    }

    isLoading(true);
    Map<String,dynamic>data = {
      'focus_id':selected.itemId,
    };
    userOnboardingController.updatefocusid(data['focus_id']);
    Map<String,dynamic> res = await ApiService().saveFocus(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.CYCLE_LEN);

    }
  }
  @override
  void onInit() {
    super.onInit();
    getPurpose();
    update();
  }

  void getPurpose() {
    purposes.add(DataList(
        isSelected: RxBool(false), itemId: "0", itemName: Strings.purpose1));
    purposes.add(DataList(
        isSelected: RxBool(false), itemId: "1", itemName: Strings.purpose2));
    purposes.add(DataList(
        isSelected: RxBool(false), itemId: "2", itemName: Strings.purpose3));
    update();
  }

  }
