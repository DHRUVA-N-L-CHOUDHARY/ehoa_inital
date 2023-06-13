import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../controllers/paywall_controller.dart';

class PaywallView extends StatelessWidget {
  const PaywallView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaywallController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kPaywallBkg)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                sizedBox(height: 24 + 24),
                Center(
                  child: headingText(Strings.subscription.tr),
                ),
                sizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: LightThemeColors.white90),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: c.index == SubscriptionType.free
                                    ? LightThemeColors.white90
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    bottomLeft: Radius.circular(16.r)),
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    bottomLeft: Radius.circular(16.r)),
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      bottomLeft: Radius.circular(16.r)),
                                  onTap: () {
                                    c.index = SubscriptionType.free;
                                    c.update();
                                  },
                                  child: Container(
                                    height: 52.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.r),
                                          bottomLeft: Radius.circular(16.r)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.free.tr,
                                        style: MyStyles.getTextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFonts.kInterMedium,
                                          color: c.index ==
                                                  SubscriptionType.free
                                              ? LightThemeColors.primaryColor
                                              : LightThemeColors.white90,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: c.index == SubscriptionType.premium
                                    ? LightThemeColors.white90
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.r),
                                      bottomRight: Radius.circular(16.r)),
                                  onTap: () {
                                    c.index = SubscriptionType.premium;
                                    c.update();
                                  },
                                  child: Container(
                                      height: 52.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16.r),
                                            bottomRight: Radius.circular(16.r)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.premium.tr,
                                          style: MyStyles.getTextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFonts.kInterMedium,
                                            color: c.index ==
                                                    SubscriptionType.premium
                                                ? LightThemeColors.primaryColor
                                                : LightThemeColors.white90,
                                          ),
                                        ),
                                      )),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                sizedBox(height: 47.5),
                Expanded(
                    child: SingleChildScrollView(
                  child: c.index == SubscriptionType.premium
                      ? Column(
                          children:
                              List.generate(c.premiumFeatures.length, (index) {
                            return FeatureCard(
                                feature: c.premiumFeatures[index]);
                          }),
                        )
                      : Column(
                          children:
                              List.generate(c.freeFeatures.length, (index) {
                            return FeatureCard(feature: c.freeFeatures[index]);
                          }),
                        ),
                )),
                sizedBox(height: 24),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppOutlineButton(
                      btnText: Strings.start30DayTrial.tr,
                      ontap: () {
                        Get.toNamed(AppPages.CHOOSE_PLAN);
                      }),
                  sizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppPages.DISC_CODE);
                      },
                      child: subHeadingText(Strings.enterDiscCode.tr))
                ],
              ),
            ),
          ));
    });
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.feature,
    Key? key,
  }) : super(key: key);

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.5.h),
      child: Row(
        children: [
          SvgPicture.asset(feature.featureIconSvg!),
          sizedBox(width: 16),
          Expanded(
            child: subHeadingText(feature.featureName!),
          )
        ],
      ),
    );
  }
}
