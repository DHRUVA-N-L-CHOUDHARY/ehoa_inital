import 'package:get/get.dart';

import '../controllers/journal_details_controller.dart';

class JournalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JournalDetailsController>(
      () => JournalDetailsController(),
    );
  }
}
