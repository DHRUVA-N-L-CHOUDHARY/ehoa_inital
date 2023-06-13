import 'package:ehoa/app/components/navbar/bottom_navbar.dart';
import 'package:ehoa/app/modules/empower/bindings/empower_binding.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/app/modules/empower/views/empower_view.dart';
import 'package:ehoa/app/modules/shop/controllers/shop_controller.dart';
import 'package:ehoa/app/modules/tips/controllers/tips_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../calendar/bindings/calendar_binding.dart';
import '../../calendar/controllers/calendar_controller.dart';
import '../../calendar/views/calendar_view.dart';
import '../../shop/bindings/shop_binding.dart';
import '../../shop/views/shop_view.dart';
import '../../symptoms/bindings/symptoms_binding.dart';
import '../../symptoms/controllers/symptoms_controller.dart';
import '../../symptoms/views/symptoms_view.dart';
import '../../tips/bindings/tips_binding.dart';
import '../../tips/views/tips_view.dart';

class BaseControlller extends GetxController {
  int selectedIndex = BottomBarSelection.calendar;
  final pages = <String>[
    AppPages.CALENDAR,
    AppPages.SHOP,
    AppPages.SYMPTOMS,
    AppPages.TIPS,
    AppPages.EMPOWER,
  ];


  void changePage(int index) {
    selectedIndex = index;
    update();
    Get.toNamed(pages[index], id: 1);
    //update();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    // Get.deleteAll(force: true);
    if (settings.name == AppPages.CALENDAR) {
      Get.delete<CalendarController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const CalendarView(),
        binding: CalendarBinding(),
      );
    }

    if (settings.name == AppPages.SHOP) {
      Get.delete<ShopController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const ShopView(),
        binding: ShopBinding(),
      );
    }

    if (settings.name == AppPages.SYMPTOMS) {
      // if(deleteVM!){
      Get.delete<SymptomsController>(force: true); //}
      return GetPageRoute(
        settings: settings,
        page: () => const SymptomsView(),
        binding: SymptomsBinding(),
      );
    }

    if (settings.name == AppPages.TIPS) {
      Get.delete<TipsController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const TipsView(),
        binding: TipsBinding(),
      );
    }

    if (settings.name == AppPages.EMPOWER) {
      Get.delete<EmpowerController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const EmpowerView(),
        binding: EmpowerBinding(),
      );
    }
    //update();
    return null;
  }

  @override
  void onInit() {
    super.onInit();

    update();
  }
}


