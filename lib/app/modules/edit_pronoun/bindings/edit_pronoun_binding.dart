import 'package:get/get.dart';

import '../controllers/edit_pronoun_controller.dart';



class EditPronounBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPronounController>(
      () => EditPronounController(),
    );
  }
}
