import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../menu/views/menu_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (c) {
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
                  icon: AppIcons.kRightArrowIcon),
            ],
            middle: [
              Text(
                Strings.settings,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 14,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              sizedBox(height: 48),
              MyListTile(
                keyName: Strings.userID,
                valueName: MySharedPref.getUserId().toString(),
                showBottomBorder: false,
                showTopBorder: false,
              ),
                MyListTile(
                keyName: Strings.contentLanguage,
                valueName: "English",
                showBottomBorder: false,
                showTopBorder: false,
                onTap: (){
                  Get.toNamed(AppPages.LANG);

                },
              ),
              const MyListTile(
                keyName: Strings.appVersion,
                valueName: "0.1",
                showBottomBorder: false,
                showTopBorder: false,
              ),
              const MyListTile(
                keyName: Strings.planType,
                valueName: "Standard",
                showBottomBorder: false,
                showTopBorder: false,
              ),
              sizedBox(height: 80),
              MyListTile(
                keyName: Strings.cycleSyncGoogleCalendar,
                keyIcon: AppIcons.kgooglCal,
                showTopBorder: true,
                onTap: () {
                  Get.toNamed(AppPages.CYCLE_SYNC_WITH_G_CAL);
                },
              ),
              MyListTile(
                keyName: Strings.privacySettings,
                keyIcon: AppIcons.kPrivacySetting,
                onTap: () {
                  Get.toNamed(AppPages.PRIVACY_SETTINGS);
                },
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyListTile(
                keyName: Strings.deleteAcc,
                keyIcon: AppIcons.kDelte,
                showBottomBorder: false,
              ),
              sizedBox(height: 16)
            ],
          ),
        ),
      );
    });
  }
}
