import 'package:ehoa/app/data/local/play_list_model.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';
import '../../blog/controllers/blog_controller.dart';

class DailyRitualsDetailsController extends GetxController with BaseController {
  final empowerCtrl = Get.put(EmpowerController());
  List<Tabs> tabs = List.empty(growable: true);
  List<PlayListData> guideList = List.empty(growable: true);
  List<PlayListData> meditationList = List.empty(growable: true);

  int selectedTab = 0;

  @override
  void onReady() async {
    super.onReady();
    getTabs();
    getBlogs();
    getPodcasts();
    update();
  }

  void getBlogs() {
    meditationList.add(PlayListData(
        id: "0",
        imageUrl: AppImages.dra,
        title: "Pick me up",
        titleCategory: "Pick me up",
        otherInfo: "Written by Samantha Veitch"));
    meditationList.add(PlayListData(
        id: "1",
        imageUrl: AppImages.dra,
        title: "Modern Maramataka",
        titleCategory: "Modern Maramataka",
        otherInfo: "Written by Samantha Veitch"));
    meditationList.add(PlayListData(
        id: "2",
        imageUrl: AppImages.dra,
        title: "Pick me up",
        titleCategory: "Modern Maramataka",
        otherInfo: "Written by Samantha Veitch"));
  }

  void getPodcasts() {
    guideList.add(PlayListData(
        id: "0",
        imageUrl: AppImages.dra,
        title: "9min Wake up meditation",
        titleCategory: "Pick me up",
        otherInfo: "10mins"));
    guideList.add(PlayListData(
        id: "1",
        imageUrl: AppImages.dra,
        title: "9min Wake up meditation",
        titleCategory: "Pick me up",
        otherInfo: "14mins"));
    guideList.add(PlayListData(
        id: "2",
        imageUrl: AppImages.dra,
        title: "9min Wake up meditation",
        titleCategory: "Pick me up",
        otherInfo: "16mins"));
  }

  void getTabs() {
    tabs.add(Tabs(
        name: "Guide",
        index: 0,
        onTap: () {
          selectedTab = 0;
          update();
        }));
    tabs.add(Tabs(
        name: "Meditaion",
        index: 1,
        onTap: () {
          selectedTab = 1;
          update();
        }));
  }
}
