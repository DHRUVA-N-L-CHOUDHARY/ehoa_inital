
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/list_selection_tile.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/privacy_setting_controller.dart';


class PrivacySettingsView extends StatelessWidget {
  const PrivacySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacySettingsController>(
      builder: (c) {
        return Scaffold(
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
              Strings.privacySettings,
              style: MyStyles.getTextStyle(
                  fontFamily: AppFonts.kInterRegular,
                  fontSize: 14,
                  color: LightThemeColors.white90),
            )
          ],
        ),
        
          backgroundColor: LightThemeColors.backViewPagerColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(height: 48),
                    Text(Strings.dontSellData, style: MyStyles.getTextStyle(fontFamily: AppFonts.kInterMedium, fontSize: 18),),
                    sizedBox(height: 5),
                    subHeadingText(Strings.loremPara),
                    sizedBox(height: 15),
                    Text(Strings.codeSuccessSubHeading, style: MyStyles.getTextStyle(fontFamily: AppFonts.kInterMedium, fontSize: 18),),
                    sizedBox(height: 5),
                    subHeadingText(Strings.loremPara),
                    sizedBox(height:48),
                  ],
                ),
              ),
              MyListTile(keyName: Strings.codeSuccessSubHeading, showTopBorder: true,),
              MyListTile(keyName: Strings.codeSuccessSubHeading)
            ],
          ),
          
          );
      }
    );
  }
}
