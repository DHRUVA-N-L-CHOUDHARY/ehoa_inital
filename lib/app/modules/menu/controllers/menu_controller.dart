import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/apiModels/MyProfileRes.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';
import '../../login/controllers/login_controller.dart';

class AppMenuController extends GetxController with BaseController {

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

 Future fetchProfile() async {
    debugPrint("auth ${ApiInterface.auth}");
    Map<String, dynamic> profileMap =
        await ApiService().showProfile(id: MySharedPref.getUserId());
    if (profileMap.isNotEmpty) {
      MyProfileResponse obj = MyProfileResponse.fromJson(profileMap);
      MySharedPref.setEmail(obj.showUser?.first.email ?? "");
      MySharedPref.setName(obj.showUser?.first.name ?? "");
      MySharedPref.setPeriodDay(obj.showUser?.first.periodDay ?? "");
          MySharedPref.setPeriodLen(
              parseInt(obj.showUser?.first.averageCycleDays.toString()));
      MySharedPref.setCycleLen(
              parseInt(obj.showUser?.first.averageCycleLength.toString()));              
    }
    refresh();
  }
}
