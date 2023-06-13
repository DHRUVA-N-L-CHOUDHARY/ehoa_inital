import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/edit_email_start_controller.dart';

class EditEmailStartView extends StatelessWidget {
  const EditEmailStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditEmailStartController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
        ),
        child: Scaffold(
            extendBodyBehindAppBar: true,
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
                  Strings.editEmail,
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
                sizedBox(height: 80),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  child: Image.asset(
                    AppImages.editEmailPng,
                    fit: BoxFit.cover,
                  ),
                ),
                sizedBox(height: 16),
                Container(
                  margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: Column(
                    
                    children: [
                      headingText(Strings.verifyEmailHeading),
                      sizedBox(height: 24),
                      subHeadingText(Strings.verifyEmailSubHeading, textAlign: TextAlign.center),
                      sizedBox(height: 80),
                      Wrap(
                        children: [
                          AppOutlineButton(
                              btnText: Strings.sendVerifiCode,
                              ontap: () {
                                Get.toNamed(AppPages.EDIT_EMAIL_END);
                              })
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
