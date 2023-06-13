import 'package:get/get.dart';
import '../controllers/period_calendar_controller.dart';


class PeriodCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeriodCalendarController>(
      () => PeriodCalendarController(),
    );
  }
}
