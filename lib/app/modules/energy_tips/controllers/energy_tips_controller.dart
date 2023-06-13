import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';
import '../../tips/controllers/tips_controller.dart';

class EnergyTipsController extends GetxController with BaseController {
  final tipsCtrl = Get.put(TipsController());
  List<DataList> energyList = List.empty(growable: true);
  DataList? subEnergy;

  @override
  void onReady() async {
    super.onReady();
    getEnergyTips();
    update();
  }

  void getEnergyTips() {
    energyList.add(DataList(
        itemId: "1",
        itemName: "Tinana (Physical)",
        itemImageUrl: AppImages.tipArticle1));
    energyList.add(DataList(
        itemId: "2",
        itemName: "Wairua (Spiritual)",
        itemImageUrl: AppImages.tipArticle4));
    energyList.add(DataList(
        itemId: "3",
        itemName: "Hinengaro  (Mental/ Emotional)",
        itemImageUrl: AppImages.tipArticle2));
    energyList.add(DataList(
        itemId: "4",
        itemName: "Whānau (Relationships)",
        itemImageUrl: AppImages.tipArticle3));
  }
}
