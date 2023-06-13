// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/common/app_utils.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/age_controller.dart';

class AgeView extends StatelessWidget {
  const AgeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgeController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kAgeBkg)),
          ),
          child:Obx(() => baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child:c.isAnimationCompleted
                      ? animatedUI(c,context)
                      : FadeInAnimation(
                    child: animatedUI(c,context),
                    animDuration:  AppConstants.appUiAnimationDuration,
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
                        c.saveDob();
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

  Column animatedUI(AgeController c, BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(
                      height: 30,
                    ),
                    backIcon(onTap: () {
                      Get.back();
                    }),
                    c.years.isEmpty
                        ? Container(
                            height: (MediaQuery.of(context).size.height / 2.25).h,
                          )
                        : Container(
                            padding:
                                EdgeInsets.only(bottom: 145.h, top: 50.h),
                            height: (MediaQuery.of(context).size.height / 2.25).h,
                            child: CupertinoPicker.builder(
                              itemExtent: 45.0,
                              onSelectedItemChanged: (val) {
                                c.selectedAge =  c.years[val].toString();
                                c.update();

                              },
                              childCount: c.years.length,
                              diameterRatio: 5,
                              // useMagnifier: true,
                              selectionOverlay: Container(),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.years.indexWhere((element) {
                                return element == 2000;
                              })),
                              magnification: 1.20,
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                  c.years[index].toString(),
                                  style: MyStyles.getTextStyle(
                                      color: LightThemeColors.white90,
                                      fontFamily: AppFonts.kInterMedium,
                                      fontSize: 15.0),
                                ));
                              },
                            ),
                          ),
                    headingText(Strings.ageHeading.tr),
                    subHeadingText(Strings.ageSubHeading.tr),
                    sizedBox(height: 24),
                    discriptionText(Strings.ageDescText.tr, fontSize: 16),
                  ],
                );
  }
}
