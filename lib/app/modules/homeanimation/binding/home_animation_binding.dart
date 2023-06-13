import 'package:ehoa/app/modules/homeanimation/controller/home_animation_controller.dart';
import 'package:get/get.dart';

class HomeAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAnimationController>(
      () => HomeAnimationController(),
    );
  }
}
