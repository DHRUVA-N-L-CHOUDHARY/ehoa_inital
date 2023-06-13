import 'package:get/get.dart';

import '../controllers/purpose_controller.dart';

class PurposeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurposeController>(
      () => PurposeController(),
    );
  }
}
