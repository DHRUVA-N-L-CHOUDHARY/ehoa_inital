import 'package:get/get.dart';
import '../controllers/energy_tips_details_controller.dart';


class EnergyTipsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnergyTipsDetailsController>(
      () => EnergyTipsDetailsController(),
    );
  }
}
