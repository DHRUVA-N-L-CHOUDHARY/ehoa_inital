import 'package:ehoa/app/data/apiModels/AppLanguageRes.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class LangController extends GetxController {
   List<DataList> langs = List.empty(growable: true);
  DataList? selected;
  var isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  final UserOnboardingController userOnboardingController = Get.find();

  Future getLanguages() async {
    isLoading(true);
    langs.clear();
    Map<String,dynamic> res = await ApiService().fetchLanguages();
    if (res.isNotEmpty) {
      AppLanguageResponse response = AppLanguageResponse.fromJson(res);
      response.showLanguage?.language?.forEach((element) {
        langs.add(DataList(itemId: element.languageId.toString(), itemName: element.langaugeName,isSelected: false.obs));
      });
    }
    update();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
   getLanguages();
     update();
  }

  Future save() async {
    isLoading(true);
    Map<String, dynamic> data = {
      'language_id':selected?.itemId??""
    };
userOnboardingController.updatelang(data['language_id']);
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.NOTIFICATON);

    }
  }
}
