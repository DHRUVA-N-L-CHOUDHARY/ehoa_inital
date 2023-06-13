import 'package:get/get.dart';

import '../../../service/base_controller.dart';
import '../../calendar/controllers/calendar_controller.dart';

class CalendarListViewController extends GetxController with BaseController {
  final calC = Get.put(CalendarController());

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    
  }
}
