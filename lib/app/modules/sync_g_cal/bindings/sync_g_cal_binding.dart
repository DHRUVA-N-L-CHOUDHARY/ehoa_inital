import 'package:get/get.dart';
import '../controllers/sync_g_cal_controller.dart';



class SyncCycleWithGCalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncCycleWithGCalController>(
      () => SyncCycleWithGCalController(),
    );
  }
}
