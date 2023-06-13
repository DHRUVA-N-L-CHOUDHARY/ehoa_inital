import 'package:get/get.dart';
import '../controllers/daily_rituals_controller.dart';


class DailyRitualsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyRitualsController>(
      () => DailyRitualsController(),
    );
  }
}
