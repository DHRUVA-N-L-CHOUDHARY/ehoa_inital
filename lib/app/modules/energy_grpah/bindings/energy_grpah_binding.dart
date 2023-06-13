import 'package:get/get.dart';

import '../controllers/energy_grpah_controller.dart';

class EnergyGraphBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnergyGraphController>(
      () => EnergyGraphController(),
    );
  }
}
