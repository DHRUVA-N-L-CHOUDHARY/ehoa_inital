import 'package:get/get.dart';

import '../controllers/monthy_mood_controller.dart';

class MonthlyMoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonthlyMoodController>(
      () => MonthlyMoodController(),
    );
  }
}
