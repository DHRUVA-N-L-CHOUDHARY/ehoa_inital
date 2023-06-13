import 'package:get/get.dart';

import '../controllers/edit_pass_controller.dart';


class EditPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPassController>(
      () => EditPassController(),
    );
  }
}
