import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/endpoints.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../controllers/menu_controller.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppMenuController>(builder: (c) {
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
                  icon: AppIcons.kBackArrowIcon)
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              sizedBox(height: 14),
              Padding(
                padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                child: Container(
                  decoration: BoxDecoration(
                      color: LightThemeColors.white5,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: LightThemeColors.stroke2)),
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(8.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: () {
                        Get.toNamed(AppPages.PROFILE);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.asset(
                                AppIcons.kProfilePicIcon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            sizedBox(width: 23),
                            Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MySharedPref.getName().isEmpty?"Username":MySharedPref.getName(),
                                    style: MyStyles.getTextStyle(
                                        fontFamily: AppFonts.kInterRegular,
                                        fontSize: 16,
                                        color: LightThemeColors.white90),
                                  ),
                                  sizedBox(height: 4),
                                  Text(
                                    MySharedPref.getEmail(),
                                    style: MyStyles.getTextStyle(
                                        fontFamily: AppFonts.kInterRegular,
                                        fontSize: 16,
                                        color: LightThemeColors.white90),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sizedBox(height: 40),
              MyListTile(
                keyName: Strings.reportingSystem,
                keyIcon: AppIcons.kRepSysIcon,
                showTopBorder: true,
                onTap: () {
                  Get.toNamed(AppPages.REPORTING_SYSTEM);
                },
              ),
              MyListTile(
                keyName: Strings.remNoti,
                keyIcon: AppIcons.kNotiIcon,
              ),
              MyListTile(
                keyName: Strings.settings,
                keyIcon: AppIcons.ksettingsIcon,
                onTap: () {
                  Get.toNamed(AppPages.SETTINGS);
                },
              ),
              MyListTile(
                keyName: Strings.shop,
                keyIcon: AppIcons.kShopSelectedIcon,
              ),
              MyListTile(
                keyName: Strings.help,
                keyIcon: AppIcons.kHelpIcon,
                onTap: (){
                  Get.toNamed(AppPages.SINGLE_CONTENT, arguments: Endpoints.HELP.toString());

                },
              ),
              MyListTile(
                keyName: Strings.aboutUs,
                keyIcon: AppIcons.kAboutUsIcon,
                onTap: () {
                  Get.toNamed(AppPages.ABOUT_US);
                },
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyListTile(
                keyName: Strings.logout,
                keyIcon: AppIcons.kLogoutIcon,
                showBottomBorder: false,
                onTap: (){
                  Get.dialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Material(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Logout",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      "Do you realy want to logout?",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    //Buttons
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            child: const Text(
                                              'Cancel',
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 45),
                                              primary: Colors.grey,
                                              onPrimary: const Color(0xFFFFFFFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();

                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: ElevatedButton(
                                            child: const Text(
                                              'Logout',
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 45),
                                              primary: Colors.grey,
                                              onPrimary: const Color(0xFFFFFFFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                              MySharedPref.clearSession();
                                              Get.offAllNamed(AppPages.INITIAL);

                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              sizedBox(height: 16)
            ],
          ),
        ),
      );
    });
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    required this.keyName,
    this.keyIcon,
    this.valueName,
    this.valueIcon,
    this.showTopBorder = false,
    this.showBottomBorder = true,
    this.onTap,
    this.isKeyIconSvg = true,
    this.isValueIconSvg = true,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String? keyName;
  final String? keyIcon;
  final String? valueName;
  final String? valueIcon;
  final bool? showTopBorder;
  final bool? showBottomBorder;
  final VoidCallback? onTap;
  final bool? isKeyIconSvg;
  final bool? isValueIconSvg;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding:
            MyPadding.getFixedHorizontalAndDynamicVerticalInsets(vertical: 14),
        decoration: BoxDecoration(
            border: Border(
          bottom: showBottomBorder!
              ? const BorderSide(color: LightThemeColors.stroke2)
              : const BorderSide(color: Colors.transparent),
          top: showTopBorder!
              ? const BorderSide(color: LightThemeColors.stroke2)
              : const BorderSide(color: Colors.transparent),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                keyIcon == null
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(right: 15.0.w),
                        child: MyIconButton(
                          onTap: null,
                          icon: keyIcon!,
                          isSvg: isKeyIconSvg,
                        ),
                      ),
                Text(keyName ?? "", // Strings.reportingSystem,
                    style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterMedium,
                      fontSize: 14,
                      color: LightThemeColors.white90,
                    )),
              ],
            ),
            Row(
              children: [
                Text(valueName ?? "",
                    style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterMedium,
                      fontSize: 14,
                      color: LightThemeColors.white90,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w),
                  child: MyIconButton(
                    onTap: null,
                    icon: valueIcon ?? AppIcons.kRightArrowIcon,
                    isSvg: isValueIconSvg,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
