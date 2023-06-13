import 'dart:math' as math;

import 'package:ehoa/app/data/apiModels/TipsCategoryResponse.dart';
import 'package:ehoa/app/modules/energy_tips/controllers/energy_tips_controller.dart';
import 'package:ehoa/app/modules/energy_tips_details/controllers/energy_tips_details_controller.dart';
import 'package:ehoa/app/modules/tips/views/tips_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/base_controller.dart';
import '../../energy_tips/bindings/energy_tips_binding.dart';
import '../../energy_tips/views/energy_tips_view.dart';
import '../../energy_tips_details/bindings/energy_tips_details_binding.dart';
import '../../energy_tips_details/views/energy_tips_details_view.dart';

class TipsController extends GetxController with BaseController {
  List<DataList> energyTipsList = List.empty(growable: true);
  int tipsNestedKey = math.Random().nextInt(10000);
  RxBool isLoading = false.obs;
  DataList? energy;

  Future getTips() async {
    isLoading(true);
    Map<String, dynamic> res = await ApiService().fetchTipsCategory();
    if (res.isNotEmpty) {
      TipsCategoryResponse categoryResponse =
          TipsCategoryResponse.fromJson(res);
      categoryResponse.showDisorders?.forEach((element) {
        energyTipsList.add(DataList(
            itemId: element.disordersId.toString(),
            itemName: element.name,
            itemImageUrl: element.icon));
      });
    }
    update();
    isLoading(false);
  }

  @override
  void onReady() async {
    super.onReady();
    getTips();
    update();
  }

  int selectedIndex = TipSelection.tips;
  final pages = <String>[
    AppPages.TIPS,
    AppPages.ENERGY_TIPS,
    AppPages.ENERGY_TIPS_DETAILS,
  ];

  void changePage(int index, {args}) {
    selectedIndex = index;
    update();
    Get.toNamed(pages[index], id: tipsNestedKey, arguments: args);
    //update();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    // Get.deleteAll(force: true);
    //Get.delete<EmpowerController>();
    if (settings.name == AppPages.TIPS) {
      return GetPageRoute(
        settings: settings,
        page: () => const TipsHomeView(),
        //binding: CalendarBinding(),
      );
    }

    if (settings.name == AppPages.ENERGY_TIPS) {
      Get.delete<EnergyTipsController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const EnergyTipsView(),
        binding: EnergyTipsBinding(),
      );
    }

    if (settings.name == AppPages.ENERGY_TIPS_DETAILS) {
      Get.delete<EnergyTipsDetailsController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const EnergyTipsDetailsView(),
        binding: EnergyTipsDetailsBinding(),
      );
    }

    return null;
  }
}

class TipSelection {
  static const tips = 0;
  static const eneryTip = 1;
  static const eneryTipDetails = 2;
}
