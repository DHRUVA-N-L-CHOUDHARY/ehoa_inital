import 'package:get/get.dart';

import '../controllers/edit_height.dart';


class EditHeightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditHeightController>(
      () => EditHeightController(),
    );
  }
}
