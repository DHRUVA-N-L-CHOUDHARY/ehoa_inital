import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/data_list_model.dart';
import '../../../service/base_controller.dart';

class PodcastController extends GetxController with BaseController {
  List<DataList> podcasts = List.empty(growable: true);

  final empowerCtrl= Get.put(EmpowerController());

  @override
  void onReady() async {
    super.onReady();
    getPodcasts();
    update();
  }

  void getPodcasts() {
    podcasts.add(DataList(
        itemId: "0",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
    podcasts.add(DataList(
        itemId: "1",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
    podcasts.add(DataList(
        itemId: "2",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
    podcasts.add(DataList(
        itemId: "3",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
    podcasts.add(DataList(
        itemId: "4",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
    podcasts.add(DataList(
        itemId: "5",
        itemImageUrl: AppImages.podcastArticle,
        itemName: "Podcast Name"));
  }
}
