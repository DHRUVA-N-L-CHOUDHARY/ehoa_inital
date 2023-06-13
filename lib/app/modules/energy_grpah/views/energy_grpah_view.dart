
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/energy_grpah_controller.dart';

class EnergyGraphView extends StatelessWidget {
  const EnergyGraphView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnergyGraphController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
          ),
          child: SafeArea(
            child: Scaffold(
              appBar: MyAppBar(
                leading: [
                  MyIconButton(
                      onTap: () {
                        Get.back();
                      },
                      isSvg: true,
                      icon: AppIcons.kBackArrowIcon),
                ],
                middle: [
                  Text(
                    Strings.energyGraph,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Scaffold(
                appBar: MyAppBar(
                  leading: [
                    MyIconButton(
                        onTap: () {
                         // Get.back();
                        },
                        isSvg: true,
                        icon: AppIcons.kBackArrowIcon),
                  ],
                  middle: [
                    Text(
                      Strings.currCycle,
                      style: MyStyles.getTextStyle(
                          fontFamily: AppFonts.kInterRegular,
                          fontSize: 14,
                          color: LightThemeColors.white90),
                    )
                  ],
                  actions: [
                    MyIconButton(
                        onTap: () {
                         // Get.back();
                        },
                        isSvg: true,
                        icon: AppIcons.kRightArrowIcon),
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: PageView(
                  children: [
                    sizedBox(height: 80),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(AppImages.gr2Png,),
                          ),
                        ],
                      ),
                    )
                  ],
                )))));
      }
    );
  }
}
