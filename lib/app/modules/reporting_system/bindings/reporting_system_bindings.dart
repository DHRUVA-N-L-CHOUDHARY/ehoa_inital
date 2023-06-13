import 'package:get/get.dart';

import '../controllers/reporting_system_controller.dart';

class ReportingSystemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportingSystemController>(
      () => ReportingSystemController(),
    );
  }
}
