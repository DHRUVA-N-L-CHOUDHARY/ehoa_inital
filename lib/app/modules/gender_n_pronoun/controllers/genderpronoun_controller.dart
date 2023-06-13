import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class GenderNPronounController extends GetxController {
  List<DataList> pronouns = List.empty(growable: true);
  List<DataList> genders = List.empty(growable: true);
  DataList? selectedPronoun, selectedGender;
  TextEditingController pronounCtlr = TextEditingController();
  TextEditingController genderCtlr = TextEditingController();
  var isAnimationCompleted = false;
  RxBool isLoading = false.obs;
   final UserOnboardingController userOnboardingController = Get.find();

  @override
  void onInit() {
    super.onInit();
    getPronounList();
    getGenderList();
    update();
  }

  getPronounList() {
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.sheHer, itemId: "1"));
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.heHim, itemId: "2"));
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.theyThem, itemId: "3"));
  }

  getGenderList() {
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.female, itemId: "0"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.male, itemId: "1"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.takatapui, itemId: "2"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.nonBinary, itemId: "3"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.genderFluid, itemId: "4"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.interSex, itemId: "5"));
  }

  Future saveGenderPronoun() async {
    isLoading(true);
    Map<String, dynamic> data = {};
    if (selectedGender?.itemId != null) {
      data['gender'] = selectedGender?.itemName;
      data['custom_gender'] = selectedGender?.itemName;
    } else {
      data['custom_gender'] = selectedGender?.itemName;
    }
    if (selectedPronoun?.itemId != null) {
      data['pronoun_id'] = selectedPronoun?.itemId;
      data['custom_pronoun'] = selectedPronoun?.itemName;
    } else {
      data['custom_pronoun'] = selectedPronoun?.itemName;
    }
    userOnboardingController.updategenderpronoun(data['gender'], data['custom_gender'],data['pronoun_id'],data['custom_pronoun']);
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.PURPOSE);
    }
  }
}
