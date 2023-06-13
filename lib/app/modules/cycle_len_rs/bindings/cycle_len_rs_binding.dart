import 'package:get/get.dart';

import '../controllers/cycle_len_rs_controller.dart';

class RSCycleLenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RSCycleLenController>(
      () => RSCycleLenController(),
    );
  }
}
