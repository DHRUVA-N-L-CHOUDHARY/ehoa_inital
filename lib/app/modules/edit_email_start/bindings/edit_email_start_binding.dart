import 'package:get/get.dart';
import '../controllers/edit_email_start_controller.dart';


class EditEmailStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailStartController>(
      () => EditEmailStartController(),
    );
  }
}
