import 'package:ehoa/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:ehoa/app/modules/create_account/controllers/create_account_controller.dart';
import 'package:ehoa/app/modules/home/controllers/home_controller.dart';

import '../../modules/tnc/controllers/tnc_controller.dart';
import '../../modules/location/controllers/location_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<TncController>(
      () => TncController(),
    );
    Get.lazyPut<LocationController>(
      () => LocationController(),
    );
  }
}
