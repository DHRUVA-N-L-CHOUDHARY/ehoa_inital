import 'package:get/get.dart';

import '../controllers/genderpronoun_controller.dart';

class GenderPronounBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderNPronounController>(
      () => GenderNPronounController(),
    );
  }
}
