import 'package:get/get.dart';
import '../controllers/edit_weigth_controller.dart';


class EditWidthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditWidthController>(
      () => EditWidthController(),
    );
  }
}
