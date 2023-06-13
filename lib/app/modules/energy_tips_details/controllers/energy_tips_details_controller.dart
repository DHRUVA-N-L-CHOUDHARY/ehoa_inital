import 'package:ehoa/app/data/local/play_list_model.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/view_pager/views/view_pager_view.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_interface.dart';
import '../../../routes/app_pages.dart';
import '../../../service/base_controller.dart';
import '../../energy_tips/controllers/energy_tips_controller.dart';
import '../../tips/controllers/tips_controller.dart';
import '../../view_pager/controllers/view_pager_controller.dart';

class EnergyTipsDetailsController extends GetxController with BaseController {
  List<PlayListData> tipsArticlelist = List.empty(growable: true);

  final tipsCtrl = Get.put(TipsController());
  final enTipsCtl = Get.put(EnergyTipsController());
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    super.onReady();
    getTipsArticlelist();
    update();
  }

  Future<void> getTipsArticlelist() async {
    isLoading(true);
    Map<String, dynamic> res = await ApiService().getTipsList(
        energyId: tipsCtrl.energy!.itemId.toString(),
        subEnergyId: enTipsCtl.subEnergy!.itemId.toString());

    List<dynamic> list = List.empty(growable: true);
    list.addAll(res["show_tips_energy"]["tips"] as List);
    tipsArticlelist.clear();

    for (int i = 0; i < list.length; i++) {
      tipsArticlelist.add(PlayListData(
          id: list[i]["tip_id"].toString(),
          imageUrl: ApiInterface.imgPath + list[i]["image"].toString(),
          title: list[i]["title"].toString(),
          titleCategory: tipsCtrl.energy!.itemName.toString(),
          otherInfo: ""));
    }
    isLoading(false);
    update();
  }

  Future<List<dynamic>> getTipsForViewPager({tipsId}) async {
    isLoading(true);
    update();
    Map<String, dynamic> res = await ApiService().getTipsForViewPager(
      tipsId: tipsId.toString(),
    );

    List<dynamic> list = List.empty(growable: true);
    list.addAll(res["show_tips_detail"] as List);
    return list;
  }

  Future<void> showTips({tipsId}) async {
    final c = Get.put(ViewPagerController());
    List<dynamic> list = await getTipsForViewPager(tipsId: tipsId);
    c.pageList.clear();

    for (int i = 0; i < list.length; i++) {
      c.pageList.add(ViewPagerData(
          id: list[i]["tip_id"].toString(),
          title: list[i]["title"],
          description: list[i]["description"],
          image: ApiInterface.imgPath + list[i]["image"],
          isBuy: false,
          isShare: true));
    }
    isLoading(false);
    update();

    Get.toNamed(AppPages.VIEW_PAGER);
    ViewPagerView.showSheet();
    c.update();
  }
}
