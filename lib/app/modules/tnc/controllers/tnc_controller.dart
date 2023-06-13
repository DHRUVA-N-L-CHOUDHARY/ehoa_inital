import 'package:ehoa/app/data/models/user_onboarding_model.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class TncController extends GetxController {
  RxBool? isFirstConditionChecked = false.obs;
  RxBool? isSecondConditionChecked = false.obs;
  final UserOnboardingController userOnboardingController = Get.find();
  bool isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  Future saveTnC() async {
    isLoading(true);
    Map<String, String> data = {'is_term': "1", 'is_understand': "1"};
    userOnboardingController.updateisterm(
        data['is_term'] ?? "", data['is_understand'] ?? "");
    Map res = await ApiService().saveTerms(data);
    if (res.isNotEmpty) {
      Get.toNamed(AppPages.LOCATION);
    }
    isLoading(false);
  }
}
