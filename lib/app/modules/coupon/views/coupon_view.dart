import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends StatelessWidget {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(c.showSuccess!
                    ? AppImages.kPopupSucBkg
                    : AppImages.kPopupBkg)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: ListView(
                //shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 12.h,
                        child: Container(),
                        // child: !c.showSuccess! ? Container() : Spring.opacity(
                        //   endOpacity: 1,
                        //   startOpacity: 0,
                        //   animDuration: const Duration(seconds: 5),
                        //   child: Image.asset(AppImages.kDecoration,fit: BoxFit.fitWidth,)
                        // )
                        ),
                       Container(
                          margin:
                             // MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                              EdgeInsets.only(left: 24.w,right: 24.w, top:   (MediaQuery.of(context).size.height/6.5).h,),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16.w, vertical: 48.h),
                          decoration: BoxDecoration(
                            color: LightThemeColors.glassBkgColor,
                            border:
                                Border.all(color: LightThemeColors.glassStrokColor),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: c.showSuccess!
                              ? Center(
                                child:  Column(
                                      children: [
                                        Image.asset(AppImages.kKoru),
                                        sizedBox(height: 80),
                                        headingText(Strings.codeSuccess.tr),
                                        sizedBox(height: 6),
                                        subHeadingText(
                                            Strings.codeSuccessSubHeading.tr),
                                        sizedBox(height: 48),
                                        AppOutlineButton(
                                          btnText: Strings.getPremiumForYear,
                                          ontap: () {
                                            Get.toNamed(AppPages.BASE);
                                            debugPrint("ABLE TO PRESS");},
                                        )
                                      ],
                                    
                                ),
                              )
                              : Center(
                                child: Column(
                                    children: [
                                      headingText(Strings.enterDiscCode),
                                      sizedBox(height: 8),
                                      subHeadingText(Strings.discountTextSubHeading),
                                      sizedBox(height: 48),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              cursorColor: LightThemeColors.white90,
                                              autofocus: true,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .glassStrokColor),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .glassStrokColor),
                                                  ),
                                                  focusColor: LightThemeColors
                                                      .glassStrokColor),
                                              style: MyStyles.getTextStyle(
                                                fontFamily: AppFonts.kInterMedium,
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      sizedBox(height: 48),
                                      AppOutlineButton(
                                          btnText: Strings.useCode.tr,
                                          ontap: () {
                                            c.showSuccess = true;
                                            c.update();
                                          })
                                    ],
                                  ),
                              ),
                        ),
                      
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
