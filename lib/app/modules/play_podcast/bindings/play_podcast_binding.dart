import 'package:get/get.dart';
import '../controllers/play_podcast_controller.dart';


class PlayPodcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayPodcastController>(
      () => PlayPodcastController(),
    );
  }
}
