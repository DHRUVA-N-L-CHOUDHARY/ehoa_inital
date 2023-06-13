// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/list_selection_tile.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/language_controller.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kLangBkg)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                c.isAnimationCompleted
                    ? animatedUI(c)
                    : SlideUpAnimation(
                  child: animatedUI(c),
                  withFade: true,
                  animDuration: AppConstants.appUiAnimationDuration,
                  animStatus: (status) {
                    if (status == AnimStatus.completed) {
                      c.isAnimationCompleted = true;
                    }
                  },
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 64),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap:c.selected== null?null: () {
                        c.save();
                      }),
                ],
              ),
            ),
          ))));
    });
  }

  Container animatedUI(LangController c) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(
            height: 30,
          ),
          backIcon(onTap: () {
            Get.back();
          }),
          sizedBox(height: 35),
          headingText(Strings.langHeading.tr),
          subHeadingText(Strings.langSubHeading.tr),
          sizedBox(height: 32),
          Column(
            children: List.generate(c.langs.length, (index) {
              return ListSelectionTile(
                data: c.langs[index],
                onTap: () {
                  c.langs.forEach((element) {
                    element.isSelected = false.obs;
                  });
                  c.langs[index].setIsSelected = RxBool(true);
                  c.selected = c.langs[index];
                  c.update();
                },
                padding: EdgeInsets.zero,
              );
            }),
          )
        ],
      ),
    );
  }
}
