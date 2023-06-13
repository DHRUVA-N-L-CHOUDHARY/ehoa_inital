// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/reporting_system_controller.dart';

class ReportingSystemView extends StatelessWidget {
  const ReportingSystemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportingSystemController>(builder: (c) {
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
                    Strings.reportingSystem,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  sizedBox(height: 48),
                  Container(
                    margin:
                        MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RSOptions(
                                img: AppImages.rs1Png,
                                text: Strings.cycleLen,
                                onTap: () {
                                  Get.toNamed(AppPages.RS_CYCLE_LEN);
                                },
                              ),
                            ),
                            sizedBox(width: 16),
                            Expanded(
                              child: RSOptions(
                                img: AppImages.rs2Png,
                                text: Strings.mood,
                                onTap: () {
                                  Get.toNamed(AppPages.MONTHLY_MOOD);
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBox(height: 32),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RSOptions(
                                img: AppImages.rs3Png,
                                text: Strings.energyGraph,
                                onTap: () {
                                  Get.toNamed(AppPages.ENERGY_GRAPH);
                                },
                              ),
                            ),
                            sizedBox(width: 16),
                            Expanded(
                              child: RSOptions(
                                img: AppImages.rs4Png,
                                text: Strings.journal,
                                onTap: () {
                                  Get.toNamed(AppPages.JOURNAL);
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBox(height: 57),
                        GlassContainer(
                          child: Column(
                            children: [
                              headingText(Strings.exportNow),
                              sizedBox(height: 8),
                              subHeadingText(Strings.exportNowSub),
                              sizedBox(height: 32),
                              AppOutlineButton(
                                  btnText: Strings.exportToPdf, ontap: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )));
    });
  }
}

class GlassContainer extends StatelessWidget {
  GlassContainer({
    this.padding,
    this.margin,
    this.radius = 16,
    required this.child,
    Key? key,
  }) : super(key: key);

  EdgeInsets? padding;
  EdgeInsets? margin;
  double? radius;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            margin: margin, //?? MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
            padding:
                padding ?? EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            decoration: MyDecoration.getGlassDecoration(),
            child: child,
          ),
        ),
      ],
    );
  }
}

class RSOptions extends StatelessWidget {
  const RSOptions({
    required this.img,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String img;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Container(
            width: 163.w,
            height: 163.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
        ),
        sizedBox(height: 12),
        Text(
          text,
          style: MyStyles.getTextStyle(
              fontFamily: AppFonts.kInterMedium, fontSize: 16),
        ),
      ],
    );
  }
}
