// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/app_text_field.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/name_controller.dart';

class NameView extends StatelessWidget {
  const NameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NameController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kNameBkg)),
          ),
          child:Obx(() =>  baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: c.isAnimationCompleted
                      ? animatedUI(c)
                      : FadeInAnimation(
                    child: animatedUI(c),
                    animDuration: AppConstants.appUiAnimationDuration,
                    animStatus: (status) {
                      if (status == AnimStatus.completed) {
                        c.isAnimationCompleted = true;
                      }
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () {
                        c.saveName();

                      }),
                  sizedBox(height: 35),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(),
                      sizedBox(width: 8),
                      PageIndicator(),
                      sizedBox(width: 8),
                      PageIndicator(),
                      sizedBox(width: 8),
                      PageIndicator(),
                      sizedBox(width: 8),
                      PageIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          ))));
    });
  }

  Column animatedUI(NameController c) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(
                      height: 30,
                    ),
                    backIcon(onTap: () {
                      Get.back();
                    }),
                    sizedBox(height: 35),
                    headingText(Strings.nameScreenHeading.tr),
                    subHeadingText(Strings.whatIsYourName.tr),
                    sizedBox(height: 24),
                    discriptionText(Strings.nameDescText1.tr, fontSize: 16),
                    sizedBox(height: 24),
                    discriptionText(Strings.nameDescText2.tr, fontSize: 16),
                    sizedBox(height: 60),
                    AppTextField(
                      controller: c.nameCtrl,
                      labelText: Strings.enterName.tr,
                    ),
                  ],
                );
  }
}
