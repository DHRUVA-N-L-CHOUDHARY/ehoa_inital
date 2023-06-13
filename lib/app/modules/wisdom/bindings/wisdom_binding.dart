import 'package:get/get.dart';
import '../controllers/wisdom_controller.dart';


class WisdomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WisdomController>(
      () => WisdomController(),
    );
  }
}
