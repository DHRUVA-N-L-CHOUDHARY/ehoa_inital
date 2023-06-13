
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/journal_controller.dart';

class JouranlView extends StatelessWidget {
  const JouranlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JouranlController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
          ),
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
                    Strings.journal,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),
          backgroundColor: Colors.transparent,
          body: Container(),
          ));
      }
    );
  }
}
