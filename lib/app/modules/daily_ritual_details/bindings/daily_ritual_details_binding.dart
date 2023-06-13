import 'package:get/get.dart';
import '../controllers/daily_ritual_details_controller.dart';


class DailyRitualsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyRitualsDetailsController>(
      () => DailyRitualsDetailsController(),
    );
  }
}
