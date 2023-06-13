import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/page_indicator.dart';
import 'package:ehoa/app/components/popup_header.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/choose_plan/controllers/choose_plan_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_fonts.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';

class ChoosePlanView extends StatelessWidget {
  const ChoosePlanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoosePlanController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kPaywallBkg)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                                child: headingText(Strings.choosePlan)),
                          ),
                          PopupHeader.closeIcon()
                        ],
                      ),
                    ),
                    sizedBox(
                      height: 24,
                    ),
                    Center(child: Image.asset(AppImages.appLogoMainPng)),
                    sizedBox(height: 60),

                    //Change to gridview if needed
                    IntrinsicHeight(
                      child: Row(
                          children: List.generate(c.plans.length, (index) {
                        return Expanded(
                            flex: 1,
                            child: GlassTiles(
                              plan: c.plans[index],
                              onTap: () {
                                c.selectedPlan = c.plans[index].index!;
                                c.update();
                              },
                              selectedPlan: c.selectedPlan,
                            ));
                      })),
                    ),
                    sizedBox(height: 31),
                    Padding(
                      padding: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Center(
                          child: subHeadingText(Strings.donationText.tr,
                              textAlign: TextAlign.center)),
                    ),
                    sizedBox(height: 48),
                    Padding(
                      padding: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: AppOutlineButton(
                        btnText: Strings.start30DayTrial.tr,
                        ontap: () {
                          Get.toNamed(AppPages.BASE);
                        },
                      ),
                    ),

                    Padding(
                      padding: MyPadding
                          .getFixedHorizontalAndDynamicVerticalInsets(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          sizedBox(height: 14),
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppPages.DISC_CODE);
                                  },
                                  child: subHeadingText(
                                      Strings.enterDiscCode.tr,
                                      textAlign: TextAlign.center))),
                          sizedBox(height: 50),
                          subHeadingText(Strings.resolveSubs.tr,
                              fontSize: MyFonts.subHeadingTextSizeS),
                          sizedBox(height: 16),
                          subHeadingText(Strings.termsOfService.tr,
                              fontSize: MyFonts.subHeadingTextSizeS),
                          sizedBox(height: 16),
                          subHeadingText(Strings.privacyPolicy.tr,
                              fontSize: MyFonts.subHeadingTextSizeS),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            // bottomNavigationBar: Padding(
            //   padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
            //       bottom: 64),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       subHeadingText(Strings.enterDiscCode.tr),
            //       sizedBox(height: 60),
            //       subHeadingText(Strings.resolveSubs.tr,
            //           fontSize: MyFonts.subHeadingTextSizeS),
            //       sizedBox(height: 16),
            //       subHeadingText(Strings.termsOfService.tr,
            //           fontSize: MyFonts.subHeadingTextSizeS),
            //       sizedBox(height: 16),
            //       subHeadingText(Strings.privacyPolicy.tr,
            //           fontSize: MyFonts.subHeadingTextSizeS),
            //     ],
            //   ),
            // ),
          ));
    });
  }
}

class GlassTiles extends StatelessWidget {
  const GlassTiles({
    required this.plan,
    this.onTap,
    this.selectedPlan,
    Key? key,
  }) : super(key: key);

  final Plan plan;
  final VoidCallback? onTap;
  final int? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w, left: plan.index == 0 ? 12.w : 0),
      //padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: selectedPlan == plan.index
              ? LightThemeColors.bodyBlack
              : LightThemeColors.glassBkgColor,
          border: Border.all(color: LightThemeColors.glassStrokColor),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: selectedPlan == plan.index
              ? [
                  const BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 16,
                    spreadRadius: 0,
                    color: LightThemeColors.white38,
                  ),
                  const BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 100,
                    spreadRadius: 0,
                    color: LightThemeColors.purpleDropShadow,
                  )
                ]
              : null),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: onTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          plan.amount!,
                          style: MyStyles.getTextStyle(
                              fontFamily: AppFonts.kInterBold,
                              fontSize: 32,
                              color: LightThemeColors.white90),
                        ),
                        sizedBox(height: 8),
                        subHeadingText(plan.info!)
                      ],
                    )),
                    sizedBox(width: 16),
                    PageIndicator(
                      isTransparent: selectedPlan != plan.index,
                      showCheck: true,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -15,
                  left: 50,
                  child: plan.discountText != null
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 5.5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: LightThemeColors.discountChipColor),
                          child: Text(
                            plan.discountText!,
                            style: MyStyles.getTextStyle(
                                fontSize: 12,
                                fontFamily: AppFonts.kInterRegular,
                                color: LightThemeColors.white80),
                          ),
                        )
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
