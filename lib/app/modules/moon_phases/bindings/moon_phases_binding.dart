import 'package:get/get.dart';

import '../controllers/moon_phases_controller.dart';


class MoonPhasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoonPhasesController>(
      () => MoonPhasesController(),
    );
  }
}
