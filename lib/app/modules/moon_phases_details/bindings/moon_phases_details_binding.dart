import 'package:get/get.dart';
import '../controllers/moon_phases_details_controller.dart';

class MoonPhasesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoonPhasesDetailsController>(
      () => MoonPhasesDetailsController(),
    );
  }
}
