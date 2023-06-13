import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/app/modules/play_podcast/views/play_podcast_view.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';

class PlayPodcastController extends GetxController with BaseController {
  final empowerCtrl = Get.put(EmpowerController());
  PodcastData? podcastData;

  // @override
  // void onReady() async {
  //   super.onReady();
  //   PlayPodcastView.showSheet();
  //   update();
  // }
}

class PodcastData {

  PodcastData({this.podcastId, this.catId, this.title, this.description, this.audio, this.thumbnail});

  String? podcastId;
  String? catId;
  String? title;
  String? description;
  String? thumbnail;
  String? audio;
}
