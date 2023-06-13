import 'package:get/get.dart';

import '../controllers/edit_age_controller.dart';


class EditAgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAgeController>(
      () => EditAgeController(),
    );
  }
}
