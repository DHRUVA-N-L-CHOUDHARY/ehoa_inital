import 'package:get/get.dart';

import '../controllers/symptoms_controller.dart';



class SymptomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SymptomsController>(
      () => SymptomsController(),
    );
  }
}
