import 'package:get/get.dart';
import '../controllers/podcasts_detail_controller.dart';


class PodcastDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PodcastDetailsController>(
      () => PodcastDetailsController(),
    );
  }
}
