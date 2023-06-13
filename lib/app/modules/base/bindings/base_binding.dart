import 'package:ehoa/app/components/navbar/navbar_controller.dart';
import 'package:ehoa/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
     Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<BaseControlller>(
      () => BaseControlller(),
    );
  }
}
