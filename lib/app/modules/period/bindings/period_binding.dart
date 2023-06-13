import 'package:ehoa/app/modules/period/controllers/period_controller.dart';
import 'package:get/get.dart';

class PeriodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeriodController>(
      () => PeriodController(),
    );
  }
}
