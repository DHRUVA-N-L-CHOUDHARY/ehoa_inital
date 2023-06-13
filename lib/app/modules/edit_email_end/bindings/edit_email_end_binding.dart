import 'package:get/get.dart';
import '../controllers/edit_email_end_controller.dart';


class EditEmailEndBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailEndController>(
      () => EditEmailEndController(),
    );
  }
}
