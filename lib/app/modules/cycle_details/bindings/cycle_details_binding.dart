import 'package:get/get.dart';

import '../controllers/cycle_details_controller.dart';


class CycleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleDetailsController>(
      () => CycleDetailsController(),
    );
  }
}
