// ignore_for_file: must_be_immutable

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
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/field_decorator.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../controllers/location_controller.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kLocation1Bkg)),
          ),
          child: baseBody(
              c.isLoading.value,
              Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: animatedUI(c),
                    ),
                  ],
                ),
                floatingActionButton: Padding(
                  padding: EdgeInsets.only(bottom: 32.h, left: 30.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      sizedBox(width: 8),
                      PageIndicator(),
                    ],
                  ),
                ),
              )));
    });
  }

  Column animatedUI(LocationController c) {
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
        headingText(Strings.noheakoe.tr),
        subHeadingText(Strings.whereAreYouFrom.tr),
        sizedBox(height: 24),
        discriptionText(Strings.description.tr, fontSize: 16),
        sizedBox(height: 60),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppPages.LOCATION_COUNTRY);
          },
          child: FieldDecorator(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                c.selectedData == null
                    ? Text(
                        Strings.whatCountry.tr,
                        style: MyStyles.getTextStyle(
                            fontSize: MyFonts.textFieldOrContentSize,
                            fontFamily: AppFonts.kInterRegular,
                            color: LightThemeColors.white80),
                      )
                    : Text(c.selectedData!.itemName.toString(),
                        style: MyStyles.getTextStyle(
                          fontSize: MyFonts.captionTextSize,
                          fontFamily: AppFonts.kInterMedium,
                          color: LightThemeColors.white90,
                        )),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
