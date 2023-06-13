import 'package:get/get.dart';

import '../controllers/cycle_len_controller.dart';

class CycleLenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleLenController>(
      () => CycleLenController(),
    );
  }
}
