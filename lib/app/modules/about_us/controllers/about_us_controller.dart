import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/apiModels/CMSResponse.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class AboutUsController extends GetxController with BaseController {
  RxString aboutShort = "".obs;
  RxString aboutlong = "".obs;
  RxString termsData = "".obs;
  RxString help = "".obs;
  RxString privacyPolicy = "".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getCmsData();
    super.onInit();
  }

  Future getCmsData() async {
    isLoading(true);
    Map<String, dynamic> cmsdata = await ApiService().showCms();
    if (cmsdata.isNotEmpty) {
      CMSResponse response = CMSResponse.fromJson(cmsdata);
      if (response.showCms != null) {
        response.showCms?.cms?.forEach((element) {
          if (element.id == 20) {
            aboutShort(element.shortDescription.toString());
            aboutlong(element.longDescription.toString());
          }
          if (element.id == 21) {
            privacyPolicy(element.longDescription.toString());
          }
          if (element.id == 22) {
            termsData(element.longDescription.toString());
          }
          if (element.id == 23) {
            help(element.longDescription.toString());
          }
        });
      }
    }
    isLoading(false);
  }
}
