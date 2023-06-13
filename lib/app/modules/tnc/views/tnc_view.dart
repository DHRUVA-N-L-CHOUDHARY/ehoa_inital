import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_fonts.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';
//import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/utility_widgets.dart';
import '../../../data/remote/endpoints.dart';
import '../controllers/tnc_controller.dart';

class TncView extends StatelessWidget {
  const TncView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TncController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kBaseBkg)),
          ),
          child:Obx(() => baseBody(c.isLoading.value,  Scaffold(
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
                      sizedBox(
                          height:
                          (MediaQuery.of(context).size.height / 3.35).h),
                      c.isAnimationCompleted
                          ? tncUI(c)
                          : SlideUpAnimation(
                        child: tncUI(c),
                        animStatus: (status) {
                          if (status == AnimStatus.completed) {
                            c.isAnimationCompleted = true;
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 64),
              child:
              //  SlideUpAnimation(
              //             child:
              Obx(() => AppOutlineButton(
                btnText: Strings.next.tr,
                ontap: (c.isFirstConditionChecked!.value &&
                    c.isSecondConditionChecked!.value)
                    ? () {
                  c.saveTnC();
                }
                    : null,
              )),
              // ),
            ),
          ))));
    });
  }

  Column tncUI(TncController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText(Strings.tncHeading1.tr),
        headingText(Strings.tncHeading2.tr),
        sizedBox(height: 48),
        Obx(() => checkboxTile(
              value: c.isFirstConditionChecked!.value,
              onChanged: (isChecked) {
                c.isFirstConditionChecked!.value = isChecked!;
                // c.update();
              },
              heading: Strings.tnc1.tr,
              subHeading: Strings.subTnc.tr,
            )),
        sizedBox(height: 29),
        Obx(() => checkboxTile(
              value: c.isSecondConditionChecked!.value,
              onChanged: (isChecked) {
                c.isSecondConditionChecked!.value = isChecked!;
                // c.update();
              },
              heading: Strings.tnc2.tr,
              subHeading: Strings.subTnc.tr,
            )),
      ],
    );
  }

  Row checkboxTile(
      {required bool? value,
      required Function(bool?)? onChanged,
      String? heading = "",
      String? subHeading = ""}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Checkbox(
            fillColor: MaterialStateProperty.all(Colors.transparent),
            //splashRadius: 2,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
            side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 1.0, color: Colors.white),
            ),
            value: value,
            onChanged: onChanged ?? (isChecked) {})
            .paddingZero
            .marginZero,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(child: checkboxHeading(heading!), onTap: (){
                  Get.toNamed(AppPages.SINGLE_CONTENT, arguments: Endpoints.PRIVACY_POLICY_ID.toString());

                }),
                InkWell(
                    onTap: (){
                      Get.toNamed(AppPages.SINGLE_CONTENT, arguments: Endpoints.PRIVACY_POLICY_ID.toString());


                    },
                    child: checkboxSubHeading(subHeading!)),
              ],
            ).paddingZero.marginZero,
          ),
        ),
      ],
    );
  }

  Widget checkboxSubHeading(String subHeading) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(subHeading,
                style: MyStyles.getTextStyle(
                    fontSize: MyFonts.subHeadingTextSizeS,
                    fontFamily: AppFonts.kInterRegular,
                    color: LightThemeColors.gray)),
          )
        ],
      );

  Widget checkboxHeading(String heading) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(heading,
                style: MyStyles.getTextStyle(
                  fontSize: MyFonts.subHeadingTextSize,
                  fontFamily: AppFonts.kInterMedium,
                )),
          )
        ],
      );
}

class SlideUpAnimation extends StatelessWidget {
  const SlideUpAnimation(
      {required this.child,
      required this.animStatus,
      this.controller,
      this.animDuration,
      this.delay,
      this.withFade = true,
      this.begin,
      this.end,
      Key? key})
      : super(key: key);

  final SpringController? controller;
  final Widget child;
  final Duration? animDuration;
  final Duration? delay;
  final bool? withFade;
  final Offset? begin;
  final Offset? end;
  final Function(AnimStatus) animStatus;

  @override
  Widget build(BuildContext context) {
    return Spring.slide(
        springController: controller,
        animStatus: animStatus,
        animDuration: animDuration ?? const Duration(seconds: 1),
        delay: delay ?? const Duration(seconds: 0),
        withFade: true,
        cutomTweenOffset: (begin != null && end != null)
            ? Tween<Offset>(begin: begin, end: end)
            : null,
        slideType: SlideType.slide_in_bottom,
        child: child);
  }
}


class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation(
      {required this.child,
      required this.animStatus,
      this.controller,
      this.animDuration,
      this.delay,
      Key? key})
      : super(key: key);

  final SpringController? controller;
  final Widget child;
  final Duration? animDuration;
  final Duration? delay;
  final Function(AnimStatus) animStatus;

  @override
  Widget build(BuildContext context) {
    return Spring.fadeIn(
        springController: controller,
        animStatus: animStatus,
        animDuration: animDuration ?? const Duration(seconds: 1),
        delay: delay ?? const Duration(seconds: 0),
        startOpacity: 0.1,
        endOpacity: 1,
        child: child);
  }
}
