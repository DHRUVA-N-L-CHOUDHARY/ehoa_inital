import 'package:ehoa/app/modules/edit_pass/controllers/edit_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/common/app_utils.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';

class EditPassView extends StatelessWidget {
  const EditPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPassController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.profileEditBkgPng)),
        ),
        child: Obx(() => baseBody(
            c.isLoading.value,
            Scaffold(
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
                    Strings.editPass,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Container(
                      margin: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextField.password(
                              labelText: Strings.enterOldPass.tr,
                              controller: c.editOldPass,

                            ),
                          )
                        ],
                      ),
                    ),
                    sizedBox(height: 15),
                    Container(
                      margin: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextField.password(
                              labelText: Strings.enterNewPass.tr,
                              controller: c.newPassCtrl,
                            ),
                          )
                        ],
                      ),
                    ),
                    sizedBox(height: 15),
                    Container(
                      margin: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextField.password(
                              labelText: Strings.enterConfirmPass.tr,
                              controller: c.confirmPass,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                            vertical: 32),
                    child: AppOutlineButton(
                        btnText: Strings.save,
                        ontap: () async {
                          await c.changePass();
                        }),
                  )
                ],
              ),
            ))),
      );
    });
  }
}
