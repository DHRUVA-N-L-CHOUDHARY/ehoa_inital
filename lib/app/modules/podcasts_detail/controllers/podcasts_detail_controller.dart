import 'package:ehoa/app/data/local/play_list_model.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';

class PodcastDetailsController extends GetxController with BaseController {
  List<PlayListData> podcastsPlaylist = List.empty(growable: true);

  final empowerCtrl = Get.put(EmpowerController());

  @override
  void onReady() async {
    super.onReady();
    getPodcastsPlayList();
    update();
  }

  void getPodcastsPlayList() {
    podcastsPlaylist.add(PlayListData(
        id: "0",
        imageUrl: AppImages.podcastArticle,
        title: "Name of Podcast 01",
        titleCategory: "Theme",
        otherInfo: "10mins"));
    podcastsPlaylist.add(PlayListData(
        id: "1",
        imageUrl: AppImages.podcastArticle,
        title: "Name of Podcast 02",
        titleCategory: "Theme",
        otherInfo: "15mins"));
    podcastsPlaylist.add(PlayListData(
        id: "2",
        imageUrl: AppImages.podcastArticle,
        title: "Name of Podcast 03",
        titleCategory: "Theme",
        otherInfo: "20mins"));
  }
}
