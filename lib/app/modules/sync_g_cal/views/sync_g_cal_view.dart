
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/sync_g_cal_controller.dart';


class SyncCycleWithGCalView extends StatelessWidget {
  const SyncCycleWithGCalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SyncCycleWithGCalController>(
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
              Strings.cycleSyncGoogleCalendar,
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
               sizedBox(height: 48),
               const MyListTile(keyName: Strings.connectGC, showTopBorder: true,),
               sizedBox(height: 52),
               Padding(
                 padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(Strings.planYourMonth, style: MyStyles.getTextStyle(fontFamily: AppFonts.kInterMedium, fontSize: 18),),
                     sizedBox(height: 10),
                     subHeadingText(Strings.planYourMonthDetail),
                     sizedBox(height: 10),
                     subHeadingText(Strings.loremPara),
                   ],
                 ),
               ),


              ],
          ),
          );
      }
    );
  }
}
