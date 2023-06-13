import 'package:get/get.dart';
import '../controllers/energy_tips_controller.dart';


class EnergyTipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnergyTipsController>(
      () => EnergyTipsController(),
    );
  }
}
