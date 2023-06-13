import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/app_text_field.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/headings.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/edit_name_controller.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNameController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.profileEditBkgPng)),
        ),
        child: Obx(() => baseBody(c.isLoading.value, Scaffold(
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
                Strings.editName,
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
                sizedBox(height: 35),
                headingText(Strings.nameScreenHeading.tr),
                subHeadingText(Strings.whatIsYourName.tr),
                sizedBox(height: 24),
                discriptionText(Strings.nameDescText1.tr, fontSize: 16),
                sizedBox(height: 24),
                discriptionText(Strings.nameDescText2.tr, fontSize: 16),
                sizedBox(height: 60),
                Container(
                  margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          labelText: Strings.enterName.tr,
                          controller: c.nameController,

                        ),
                      )
                    ],
                  ),
                ),
                sizedBox(height: 10),



              ],
            ),
          ),
          bottomNavigationBar:   Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                    vertical: 32),
                child: AppOutlineButton(btnText: Strings.save, ontap: () async {
                  await c.saveProfile();

                }),
              )
            ],
          ),

        ))),
      );
    });
  }
}
