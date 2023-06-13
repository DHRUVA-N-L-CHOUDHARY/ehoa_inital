// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
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
import '../../../components/common/app_utils.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/purpose_controller.dart';

class PurposeView extends StatelessWidget {
  const PurposeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurposeController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kGpBkg)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
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
                      headingText(Strings.purposeHeading.tr),
                      subHeadingText(Strings.purposeSubHeading.tr),
                      sizedBox(height: 24),
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
                      sizedBox(height: 15),
                      Center(
                          child: subHeadingText(Strings.updateInfo.tr,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () {
                        c.saveFocus();
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
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
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
                    ],
                  ),
                ],
              ),
            ),
          ))));
    });
  }

  Column animatedUI(PurposeController c) {
    return Column(
      children: List.generate(c.purposes.length, (index) {
        return ListSelectionTile(
          data: c.purposes[index],
          onTap: () {
            c.purposes.forEach((element) {
              element.setIsSelected = RxBool(false);
            });
            c.purposes[index].setIsSelected = RxBool(true);
            c.selected =c.purposes[index];
            c.update();
          },
          padding: EdgeInsets.zero,
        );
      }),
    );
  }
}
