import 'package:get/get.dart';

import '../controllers/view_pager_controller.dart';


class ViewPagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPagerController>(
      () => ViewPagerController(),
    );
  }
}
