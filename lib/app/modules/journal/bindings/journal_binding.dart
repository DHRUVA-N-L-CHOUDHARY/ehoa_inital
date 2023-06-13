import 'package:get/get.dart';

import '../controllers/journal_controller.dart';

class JouranlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JouranlController>(
      () => JouranlController(),
    );
  }
}
