import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool? isFirstConditionChecked = false.obs;
  RxBool? isSecondConditionChecked = false.obs;

  bool isAnimationCompleted = false;

  final UserOnboardingController userOnboardingController = Get.find();
  
  }
