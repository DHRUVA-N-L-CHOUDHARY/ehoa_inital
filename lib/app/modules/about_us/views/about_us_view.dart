
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:ehoa/app/routes/app_pages.dart';
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
import '../controllers/about_us_controller.dart';
class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
          ),
          child:Obx(() => baseBody(c.isLoading.value,  Scaffold(
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
                  Strings.aboutUs,
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
                Padding(
                  padding:  MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: Obx(() => subHeadingText(c.aboutShort.value)),
                ),
                sizedBox(height: 48),
                  MyListTile(
                  keyName: "Read more",
                  showTopBorder: true,
                  onTap: (){
                    Get.offNamed(AppPages.CONTENT_PAGE, arguments: c.aboutlong.value);
                  },
                ),
                  MyListTile(keyName: "Terms of service",
                  showTopBorder: false,
                    onTap: (){
                      Get.offNamed(AppPages.CONTENT_PAGE, arguments: c.termsData.value);
                    },
                ),
                  MyListTile(keyName: "Privacy policy",
                  showTopBorder: false,
                      onTap: (){
                        Get.offNamed(AppPages.CONTENT_PAGE, arguments: c.privacyPolicy.value);
                      }
                )
              ],
            ),

          ))),
        );
      }
    );
  }
}
