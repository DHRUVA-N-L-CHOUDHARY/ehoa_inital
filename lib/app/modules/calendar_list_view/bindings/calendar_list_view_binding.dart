import 'package:get/get.dart';

import '../controllers/calendar_list_view_controller.dart';

class CalendarListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarListViewController>(
      () => CalendarListViewController(),
    );
  }
}
