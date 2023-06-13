import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/app_text_field.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/edit_email_end_controller.dart';

class EditEmailEndView extends StatelessWidget {
  const EditEmailEndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditEmailEndController>(builder: (c) {
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
                Strings.editEmail,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 14,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
            child: Column(
              children: [
                sizedBox(height: 150),
                c.emailSuccess!
                    ? headingText(Strings.emailReset)
                    : c.enterNewEmail!
                        ? Column(
                            children: [
                              AppTextField(
                                  controller: TextEditingController(),
                                  labelText: Strings.enterNewEmail),
                              sizedBox(height: 30),
                              SizedBox(
                                //width: 2.h,
                                child: AppOutlineButton(
                                    btnText: Strings.cnfNewEmail,
                                    ontap: () {
                                      c.emailSuccess = true;
                                      c.update();
                                    }),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              AppTextField(
                                  controller: TextEditingController(),
                                  labelText: "Enter code"),
                              sizedBox(height: 30),
                              SizedBox(
                                width: 200.h,
                                child: AppOutlineButton(
                                    btnText: Strings.confrim,
                                    ontap: () {
                                      c.enterNewEmail = true;
                                      c.update();
                                    }),
                              ),
                            ],
                          )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: c.emailSuccess! ?  EdgeInsets.only(bottom: 30.h,right: 24.w,left: 24.w ) : EdgeInsets.only(bottom: 30.h, ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                c.emailSuccess!
                    ? AppOutlineButton(
                        btnText: Strings.backToHome, ontap: () {})
                    : c.enterNewEmail!
                        ? Container()
                        : Column(
                            children: [
                              headingText(Strings.notSeeingCode, fontSize: 16),
                              sizedBox(height: 16),
                              subHeadingText(Strings.sendAgain),
                            ],
                          )
              ],
            ),
          ),
        ),
      );
    });
  }
}
