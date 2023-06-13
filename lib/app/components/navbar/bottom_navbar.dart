// ignore_for_file: must_be_immutable, unused_field

import 'package:blur/blur.dart';
import 'package:ehoa/app/modules/base/controllers/base_controller.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/translations/strings_enum.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControlller>(builder: (c) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 80.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18) //Colors.transparent,
            ),
        child: Stack(
          children: [
            Blur(
              blur: 7,
              blurColor: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80.h,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomBarChild(
                      index: BottomBarSelection.calendar,
                      label: Strings.calendar,
                      svgIconPath: c.selectedIndex == BottomBarSelection.calendar ? AppIcons.kCalendarSelectedIcon :  AppIcons.kCalendarIcon,
                      onTap: () {
                        c.selectedIndex = BottomBarSelection.calendar;
                        c.changePage(BottomBarSelection.calendar);
                      },
                    ),
            /*        bottomBarChild(
                        index: BottomBarSelection.shop,
                        label: Strings.shop,
                        svgIconPath: AppIcons.kShopIcon,
                        onTap: () {
                          c.selectedIndex = BottomBarSelection.shop;
                          c.changePage(BottomBarSelection.shop);
                        }),*/
                    bottomBarChild(
                      index: BottomBarSelection.symptoms,
                      label: Strings.symptoms,
                      svgIconPath: c.selectedIndex == BottomBarSelection.symptoms ? AppIcons.kSysmptomsSelectedIcon : AppIcons.kSysmptomsIcon,
                      onTap: () {
                        c.selectedIndex = BottomBarSelection.symptoms;
                        c.changePage(BottomBarSelection.symptoms);
                      },
                    ),
                    bottomBarChild(
                      index: BottomBarSelection.tips,
                      label: Strings.tips,
                      svgIconPath: c.selectedIndex == BottomBarSelection.tips ? AppIcons.kTipsSelectedIcon : AppIcons.kTipsIcon,
                      onTap: () {
                        c.selectedIndex = BottomBarSelection.tips;
                        c.changePage(BottomBarSelection.tips);
                      },
                    ),
                    bottomBarChild(
                      index: BottomBarSelection.empower,
                      label: Strings.empower,
                      svgIconPath: c.selectedIndex == BottomBarSelection.empower ? AppIcons.kEmpowerSelectedIcon :  AppIcons.kEmpowerIcon,
                      onTap: () {
                        c.selectedIndex = BottomBarSelection.empower;
                          c.changePage(BottomBarSelection.empower);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //   ),
      );
    });
  }

  Widget bottomBarChild({
    required int index,
    required String label,
    required String svgIconPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Center(child: SvgPicture.asset(svgIconPath)),
          ),
          const SizedBox(height: 5),
          Text(label,
              style: MyStyles.getTextStyle(
                  fontFamily: AppFonts.kInterRegular,
                  fontSize: 8,
                  color: LightThemeColors.white80)),
        ],
      ),
    );
  }
}

class BottomBarSelection {
  static const calendar = 0;
  static const shop = 1;
  static const symptoms = 2;
  static const tips = 3;
  static const empower = 4;
}
